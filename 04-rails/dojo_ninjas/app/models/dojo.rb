class Dojo < ApplicationRecord
  has_many :ninja, dependent: :delete_all
  validates :name, :city, :state, presence: true
  validates :state, length: { minimum: 2 }
end
