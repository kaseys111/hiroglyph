class Comment < ActiveRecord::Base

  belongs_to :status
  belongs_to :user

    validates :body, :presence => true
    validates :user_id, :presence => true
    validates :status_id, :presence => true
end
