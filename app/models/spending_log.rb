class SpendingLog < ApplicationRecord
  validates :spending_type, presence: true
  validates :action, presence: true
  validates :amount, presence: true
  validates :quantity, presence: true
end
