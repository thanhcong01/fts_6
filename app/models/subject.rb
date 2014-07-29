class Subject < ActiveRecord::Base
  has_many :registers
  has_many :questions
  validates :context_display,  presence: true, length: { in: 6..200 }
  validates_numericality_of :total_time, greater_than: 0, less_than: 120 
  validates_numericality_of :count_question, greater_than: 0, less_than: 120 
end
