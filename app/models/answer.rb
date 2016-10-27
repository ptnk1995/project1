class Answer < ApplicationRecord
  has_many :answer_chooses, dependent: :destroy

  belongs_to :question, optional: true, inverse_of: :answers

  validates :question, presence: true
  validates :content, presence: true

  scope :recent, ->{oder created_at: :desc}
end
