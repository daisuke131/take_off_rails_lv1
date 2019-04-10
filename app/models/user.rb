class User < ApplicationRecord
  has_many :articles
  validates :account, presence: true
  validates :account, uniqueness: true
end
