class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  validates :account, presence: true
  validates :account, uniqueness: true
end
