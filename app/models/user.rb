class User < ActiveRecord::Base
  extend Enumerize

  enumerize :group, {:in => {:teacher => 0, :student => 1}, :default => :student}

  validates :name,  presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }

  has_secure_password

  before_save { self.email = email.downcase }
end