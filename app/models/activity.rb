class Activity < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :action_type, presence: true
  validates :target_id, presence: true
  validates :target_type, presence: true
end
