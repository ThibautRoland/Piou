# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :messages

  # VALID_TAGS = ['urgent', 'secret', 'rigolo']
  VALID_TAGS = %w[urgent secret rigolo].freeze

  validates :tag, presence: true, inclusion: { in: VALID_TAGS, message: 'This is not a valid tag' }
end
