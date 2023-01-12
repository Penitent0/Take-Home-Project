class Customer < ApplicationRecord
  has_many :subscriptions
  has_many :teas, through: :subscriptions

  validates :first_name, :last_name, :address, :email, presence: true
  validates_uniqueness_of :email
end
