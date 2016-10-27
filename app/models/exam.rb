class Exam < ApplicationRecord
  has_many :question_exams, dependent: :destroy
  has_many :questions, through: :question_exams

  belongs_to :user
  belongs_to :category

  validates :category, presence: true
  validates :user, presence: true

  enum status: {start: 0, testing: 1, uncheck: 2, checked: 3}

  accepts_nested_attributes_for :question_exams
  before_create :create_exam_questions
  after_create :set_default

  scope :recent, ->{order created_at: :desc}

  private
  def create_exam_questions
    self.questions = self.category.random_question
  end

  def set_default
    self.start!
    self.update mark: Settings.exams.default_mark
  end
end
