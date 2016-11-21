class Status < ActiveRecord::Base

  has_many :comments
  has_many :reactions
  belongs_to :user
  has_many :fans, :through => :comments, :source => :user

  validates :status, :presence => true
  validates :user_id, :presence => true
end
