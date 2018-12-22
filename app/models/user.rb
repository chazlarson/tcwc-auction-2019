#
class User < ApplicationRecord
  # BEGIN: public section
  # BEGIN: devise section
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  # END: devise section
  # BEGIN: constraints section
  before_save :downcase_email, :downcase_username

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :last_name, presence: true, length: { maximum: 50 }
  validates :first_name, presence: true, length: { maximum: 50 }

  VALID_USERNAME_REGEX = /\A[\w+\-.]+\z/i.freeze
  validates :username, presence: true, length: { maximum: 255 },
                       format: { with: VALID_USERNAME_REGEX },
                       uniqueness: { case_sensitive: false }
  # END: constraints section
  # END: public section

  private

  # BEGIN: private section
  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end

  # Converts username to all lower-case.
  def downcase_username
    self.username = username.downcase
  end
  # END: private section
end
