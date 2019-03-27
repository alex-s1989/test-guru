class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests
  has_many :author, class_name: 'Test'
  
  def test_by_level(level)
    tests.where(tests: { level: level })
  end
end
