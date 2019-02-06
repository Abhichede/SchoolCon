module QuestionPapersHelper

  def marks_collection
    marks = []
    @questions.each do |question|
      marks.push(question.marks.to_i) unless marks.include? question.marks.to_i
    end
    marks.sort
  end
end
