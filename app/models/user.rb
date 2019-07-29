class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  has_many :snacks

  def authenticate(plaintext_password)
    if BCrypt::Password.new(self.password_digest) == plaintext_password
      self
    else
      false
    end
  end
end
