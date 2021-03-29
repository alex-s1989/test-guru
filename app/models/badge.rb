class Badge < ApplicationRecord
  
  RULES = {
    'by_score' => [80, 100],
    'from_first_attempt' => [nil],
    'by_complexity' => ['easy', 'medium', 'hard']
  }
  
  has_many :test_passages
  has_and_belongs_to_many :users
  
  validates :rule_name, presence: true
  validates :rule_name, uniqueness: { scope: :rule_value }

  def self.rule_names
    ['by_score', 'from_first_attempt', 'by_complexity']
    RULES.keys
  end

  def self.rule_values(rule_name)
    RULES[rule_name]
  end

  
  def set_file_name
    self.file_name = rule_name + '_' + rule_value + '.png'
  end

  def self.rule
    ['by_score', 'from_first_attempt', 'by_complexity']
  end
  
end
