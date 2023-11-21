class User < ApplicationRecord
  has_secure_password
  has_many :posts
  validates :name,
            presence: true,
            length: {maximum: 30, minimum: 0}

  validates :email,
            presence: true,
            length: {maximum: 100, minimum: 0}
end
