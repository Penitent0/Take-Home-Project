class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  enum status: { active: 0, cancelled: 1 }
  enum frequency: { weekly: 0, monthly: 1 }

  validates :title, :price, :status, :frequency, :customer_id, :tea_id, presence: true
end
