class Question < ApplicationRecord
  belongs_to :test
  has_many :users_answers
  has_one :answer
end
