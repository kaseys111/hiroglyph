class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :statuses
  has_many :reactions
  has_many :statuses_commented_on, :through => :comments, :source => :status

  has_many :friend_requests_where_sender, :class_name => "FriendRequest", :foreign_key => "sender_id"

  has_many :friend_requests_where_receiver, :class_name => "FriendRequest", :foreign_key => "receiver_id"

  has_many :friends_where_sender, :through => :friend_requests_where_sender, :source => :receiver

  has_many :friends_where_receiver, :through => :friend_requests_where_receiver, :source => :sender

  has_many :timeline_statuses, :through => :friends_where_sender, :source => :statuses

  validates :email, :presence => true, :uniqueness => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  mount_uploader :profile_pic, ProfilePicUploader

end
