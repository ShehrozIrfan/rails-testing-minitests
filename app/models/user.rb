class User < ApplicationRecord
  before_save { email.downcase! }

  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
end
