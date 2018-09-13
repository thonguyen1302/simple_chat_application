class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  paginates_per 10
 
  after_create_commit { MessageBroadcastJob.perform_later(self) }
end