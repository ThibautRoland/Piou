class Message < ApplicationRecord
  belongs_to :tag
  belongs_to :user

  validates :content, presence: true
end
