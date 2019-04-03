class Test < ApplicationRecord
  has_many :users_tests
  has_many :questions, dependent: :destroy
  has_many :users, through: :users_tests
  belongs_to :category
  belongs_to :test_author, class_name: 'User', foreign_key: 'author_id'
  
  def self.by_category(category)
    Test.joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
