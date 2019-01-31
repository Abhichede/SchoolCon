class Question < ApplicationRecord
  belongs_to :standard
  belongs_to :division
  belongs_to :teacher
  belongs_to :subject
end
