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
  has_many :friend_requests, class_name: :Invitation, foreign_key: :friend_id
end

def friends
  friends_arr = invitations.map { |request| request.friend_id if request.is_accepted == true }
  friends_arr += recieved_invitations.map { |request| request.user_id if request.is_accepted == true }
  friends_arr.compact
end

def pending_requests
  invitations.map { |request| request.friend unless request.is_accepted }.compact
end

def friend_requests
  recieved_invitations.map { |request| request.user unless request.is_accepted }.compact
end

def confirm_friend(user)
  confrimation = recieved_invitations.find { |request| request.user == user }
  confrimation.is_accepted = true
  confrimation.save
end

def is_friend?(user)
  friends.include?(user.id)
end