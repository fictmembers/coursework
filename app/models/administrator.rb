class Administrator < ActiveRecord::Base
    belongs_to :restaurant
    before_create :create_remember_token

    validates :lastname, 	presence: true
    validates :tel,       presence: true, length: { minimum: 6 }
    validates :restaurant_id, 	presence: true
    validates :login,     presence: true
    validates :password,  presence: true, length: { minimum: 6 }

    has_secure_password

    def Administrator.new_remember_token
      SecureRandom.urlsafe_base64
    end

    def Administrator.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end

    private  def create_remember_token
        self.remember_token = Administrator.encrypt(Administrator.new_remember_token)
    end
end
