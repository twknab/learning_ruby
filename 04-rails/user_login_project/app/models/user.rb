class User < ApplicationRecord
  validates :first_name, :last_name, :email, :age, presence: true
  validates :first_name, :last_name, length: { in: 2..20 }
  validates :age, numericality: true
  validates_numericality_of :age, greater_than_or_equal_to: 10, less_than: 150
end
