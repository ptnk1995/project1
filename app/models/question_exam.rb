class QuestionExam < ApplicationRecord
  belongs_to :question
  belongs_to :exam

  has_many :answer_chooses, dependent: :destroy

  accepts_nested_attributes_for :answer_chooses

  validates :exam, presence: true
  validates :question, presence: true
end
