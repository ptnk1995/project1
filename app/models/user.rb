class User < ApplicationRecord
  has_many :activities, dependent: :destroy
  has_many :exams, dependent: :destroy
  has_many :suggest_questions, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
   foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
   foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  before_save {email.downcase!}
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
  enum role: [:user, :admin]
  mount_uploader :avatar, PictureUploader
  scope :recent, ->{order created_at: :desc}
  scope :order_name, ->{order name: :desc}

  def is_user? user
    self == user
  end

  def follow other_user
    active_relationships.create followed_id: other_user.id
  end

  def unfollow other_user
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following? other_user
    following.include? other_user
  end
end
