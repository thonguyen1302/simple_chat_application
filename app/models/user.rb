class User < ActiveRecord::Base
  validates :username,  presence: true, uniqueness: true

  has_many :messages
  has_many :conversations, foreign_key: :sender_id
end
