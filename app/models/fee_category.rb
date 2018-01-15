class FeeCategory < ApplicationRecord
  belongs_to :standard
  has_and_belongs_to_many :students

  def name_amount
    "#{name}-#{amount}"
  end
end
