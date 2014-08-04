class Register < ActiveRecord::Base 
  after_create :random_quesion
  before_save :update_count_corect
  belongs_to :user
  belongs_to :subject
  has_many :answer_sheets
  has_many :questions, through: :answer_sheets
  belongs_to :category
  accepts_nested_attributes_for :answer_sheets, :allow_destroy => true
  validates_numericality_of :user_id
  validates_numericality_of :subject_id
  validates_numericality_of :category_id
  private

  def update_count_corect
    self.count_correct = 0
    self.answer_sheets.each do |answer_sheet|
      
      self.count_correct += 1 if answer_sheet.correct
    end
  end

  def random_quesion
   @questions = Question.generate_random_question(self.subject_id, self.subject.count_question)
    @questions.each do |question|
      @answer_sheet = AnswerSheet.new(register_id: self.id, question_id: question.id)
      @answer_sheet.save
    end
  end
end