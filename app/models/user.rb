class User < ApplicationRecord
  
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :test_author, class_name: 'Test', foreign_key: 'author_id'
  has_many :gists
  has_and_belongs_to_many :badges
  
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
 

  def test_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
  
  def admin?
    self.is_a?(Admin)
  end

  def passed_tests_by_scope(scope)
    tests.send(scope).select do |test|
      test.test_passages.any? { |tp| tp.success_rate >= 80 }
    end.uniq
  end

  def scope_completed?(scope)
    passed_tests_by_scope(:easy).count == Test.send(scope).count
  end

end
