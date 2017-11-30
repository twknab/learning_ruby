class Blog < ApplicationRecord
  has_many :posts, dependent: :delete_all
  has_many :owners
  validates :name, :description, presence: true
end
