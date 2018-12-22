#
class User < ApplicationRecord
  # BEGIN: public section
  # BEGIN: devise section
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  # END: devise section
  # END: public section
end
