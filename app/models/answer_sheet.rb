class AnswerSheet < ActiveRecord::Base
  belongs_to :register
  belongs_to :question
  has_many :answers, through: :question
  belongs_to :answer
end
