class Register < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  has_many :question_answers
  belongs_to :category
  validates_numericality_of :user_id
  validates_numericality_of :subject_id
  validates_numericality_of :category_id
end