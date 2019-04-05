class Test < ApplicationRecord
  has_many :users_tests
  has_many :questions, dependent: :destroy
  has_many :users, through: :users_tests
  belongs_to :category
  belongs_to :test_author, class_name: 'User', foreign_key: 'author_id'

  scope :category_join, ->(category) { joins(:category).where(categories: { title: category })}

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  validates :title, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validates_uniqueness_of :title, scope: :level

  def self.by_category(category)
    category_join(category).order(title: :desc).pluck(:title)
  end

end
