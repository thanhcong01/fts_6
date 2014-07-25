class Register < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  has_may :question_answers
end
