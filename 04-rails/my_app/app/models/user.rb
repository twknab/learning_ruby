class User < ApplicationRecord
   has_one :address
   # has_one :address, dependent: :delete_all # would delete address record associated with this User if User was deleted.
end
