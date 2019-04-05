class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true

  validate :validate_count_answer

  private

  def validate_count_answer
    if answers.count >= 4
      errors.add(:question, 'Количество ответов не может быть больше 4')
    end
  end

end
