class User < ActiveRecord::Base

    has_secure_password

    has_many :products
    has_many :reviews, dependent: :destroy
    validates :email, :presence => true
    validates :email, uniqueness: true
    validates :first_name, :presence => true
    validates :last_name, :presence => true
    validates :password, length: {minimum: 8}

    def self.authenticate_with_credentials(email, pw) 
        user = User.find_by(email: email)
        user if (user && user.authenticate(pw))
    end
end

