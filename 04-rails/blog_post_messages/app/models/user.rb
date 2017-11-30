class User < ApplicationRecord
  has_many :messages, dependent: :delete_all
  has_many :posts, dependent: :delete_all
  has_many :owners, dependent: :delete_all
end
