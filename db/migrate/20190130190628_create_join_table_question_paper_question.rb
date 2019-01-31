class CreateJoinTableQuestionPaperQuestion < ActiveRecord::Migration[5.1]
  def change
    create_join_table :question_papers, :questions do |t|
      t.index [:question_paper_id, :question_id]
      t.index [:question_id, :question_paper_id]
    end
  end
end
