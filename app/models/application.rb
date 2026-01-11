class Application < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy

  enum status: {
    applied: 0,
    interview: 1,
    offer: 2,
    rejected: 3
  }

  validates :company_name, :job_title, :status, presence: true
end
