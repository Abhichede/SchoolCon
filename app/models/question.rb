class Question < ApplicationRecord
  belongs_to :standard
  belongs_to :division
  belongs_to :teacher
  belongs_to :subject

  has_and_belongs_to_many :question_papers
end
