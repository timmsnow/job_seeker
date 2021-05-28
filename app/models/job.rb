class Job < ApplicationRecord
  validates :company_name, presence: true
  validates :position, presence: true
  validates :status, presence: true
  validates :posting_url, presence: true

  belongs_to :user
  has_many :contacts
end
