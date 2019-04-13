module QuestionsHelper

  def question_header
    if @question.test_id
      'Edit "' + @question.test.title  + '" Question'
    else
      'Create New "' + @test.title  + '" Question'
    end
  end
end
