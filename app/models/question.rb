class Question < ApplicationRecord
  has_many :answers, dependent: :destroy, inverse_of: :question

  belongs_to :category

  validates :category, presence: true
  accepts_nested_attributes_for :answers, allow_destroy: true

  scope :recent, ->{order created_at: :desc}
  scope :random, ->{order("RANDOM()").limit Settings.exams.number_question}
end
