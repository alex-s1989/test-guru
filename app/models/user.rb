class User < ApplicationRecord
  
  def test_by_level(level)
    Test
      .joins('join user_tests on user_tests.tests_id = tests.id')
      .where(user_tests: { users_id: id }, tests: { level: level })
  end
end
