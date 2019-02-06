class CreateJoinTableQuestionPaperQuestion < ActiveRecord::Migration[5.1]
  def change
    create_table :question_papers_questions do |t|
      t.belongs_to :question_paper, index: true
      t.belongs_to :question, index: true
    end
  end
end
