class User < ApplicationRecord
    has_secure_password
    has_many :maintenances
    has_many :equipment, through: :maintenances

    validates :username, :email, presence: :true, uniqueness: :true
    validates :username, uniqueness: {case_sensitive: :false}
    # email format is correct
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

    def self.create_from_google(auth)
        User.find_or_create_by(email: auth[:info][:email]) do |user|
            user.username = auth[:info][:name]
            user.password = SecureRandom.hex
        end
    end


end
