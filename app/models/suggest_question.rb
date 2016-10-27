class SuggestQuestion < ApplicationRecord
  has_many :suggest_answers, dependent: :destroy, inverse_of: :suggest_question

  belongs_to :user
  belongs_to :category

  validates :user, presence: true
  validates :category, presence: true
  validates :content, presence: true, length: {minimum: 5}

  accepts_nested_attributes_for :suggest_answers, allow_destroy: true

  scope :recent, ->{order created_at: :desc}
end
