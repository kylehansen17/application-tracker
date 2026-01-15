class Note < ApplicationRecord
  belongs_to :application, counter_cache: true

  validates :content, presence: true
end
