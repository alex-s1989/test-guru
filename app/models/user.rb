class User < ApplicationRecord
  
  def test_by_level(level)
    Test
      .joins('join questions on questions.test_id = tests.id')
      .joins('join user_answers on user_answers.question_id = questions.id')
      .where(user_answers: { user_id: id }, tests: { level: level })
  end
end
