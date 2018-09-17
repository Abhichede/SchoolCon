class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :authentication_keys => [:username]
  include DeviseTokenAuth::Concerns::User

  after_create :force_mail_confirmation

  def force_mail_confirmation
    self.send_confirmation_instructions
  end

  ROLES = %i[admin teacher parent]

  def roles=(roles)
    # ==> Roles mask assigned as 1 - Admin, 2 - Teacher, 4  - Parent
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

  def as_json(options={})
    super(options).merge({success: true})
  end

  protected
    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:username)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

    # Attempt to find a user by it's email. If a record is found, send new
    # password instructions to it. If not user is found, returns a new user
    # with an email not found error.
    def self.send_reset_password_instructions attributes = {}
      recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
      recoverable.send_reset_password_instructions if recoverable.persisted?
      recoverable
    end

    def self.find_recoverable_or_initialize_with_errors required_attributes, attributes, error = :invalid
      (case_insensitive_keys || []).each {|k| attributes[k].try(:downcase!)}

      attributes = attributes.slice(*required_attributes)
      attributes.delete_if {|_key, value| value.blank?}

      if attributes.keys.size == required_attributes.size
        if attributes.key?(:username)
          login = attributes.delete(:username)
          record = find_record(login)
        else
          record = where(attributes).first
        end
      end

      unless record
        record = new

        required_attributes.each do |key|
          value = attributes[key]
          record.send("#{key}=", value)
          record.errors.add(key, value.present? ? error : :blank)
        end
      end
      record
    end

    def self.find_record login
      where(["username = :value OR email = :value", {value: login}]).first
    end
end
