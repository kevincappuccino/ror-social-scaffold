class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :invitations
  has_many :received_invitations, class_name: :Invitation, foreign_key: :friend_id

def friends
  friends_arr = invitations.map { |request| request.friend_id if request.accepted == true }
  friends_arr += received_invitations.map { |request| request.user_id if request.accepted == true }
  friends_arr.compact
end

def pending_requests
  invitations.map { |request| request.friend unless request.accepted }.compact
end

def friend_requests
  received_invitations.map { |request| request.user unless request.accepted }.compact
end

def confirm_friend(user)
  confrimation = received_invitations.find { |request| request.user == user }
  confrimation.accepted = true
  confrimation.save
end

def is_friend?(user)
  friends.include?(user.id)
end
end