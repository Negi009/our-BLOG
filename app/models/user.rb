class User < ApplicationRecord

  before_save { self.email = email.downcase }

  has_one_attached :image, dependent: :destroy
  validates :username, presence: true, uniqueness: { case_sensitive: false}, length: { minimum: 3, maximum: 20}
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false}, length: { maximum: 100}, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  
end
