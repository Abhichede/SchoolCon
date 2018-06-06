class Post < ApplicationRecord
  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments

  def created_at_local
    created_at.strftime("%d-%m-%Y %I:%M %p")
  end
end
