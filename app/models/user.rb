class User < ApplicationRecord
  include ActiveModel::Validations

  has_secure_password

  validates :email,  email: true, uniqueness: true, presence: true
  validates :password, length: 8..64
end
