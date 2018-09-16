class Test < ApplicationRecord
  has_many :users_tests
  has_many :questions
  has_many :users, through: :users_tests
  belongs_to :category
  
  def self.by_category(category)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
