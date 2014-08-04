class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :answer_sheets, through: :question
end
