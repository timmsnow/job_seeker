class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :contacts
  has_many :metric_tables
  has_many :jobs

  serialize :user_goals
end
