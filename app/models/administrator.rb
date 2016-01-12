class Administrator < ActiveRecord::Base
  has_many :messages, dependent: :destroy

  before_create :create_remember_token

  validates :login,     presence: true
  validates :password,  presence: true, length: { minimum: 6 }

  has_secure_password

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private def create_remember_token
    self.remember_token = Administrator.encrypt(Administrator.new_remember_token)
  end
end
