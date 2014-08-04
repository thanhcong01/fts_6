class Question < ActiveRecord::Base
  belongs_to :subject
  has_many :answers
  has_many :answer_sheets
  scope :generate_random_question, ->(subject_id, count_question) do
    where(subject_id: subject_id).order("rand()").limit(count_question)
  end
end
