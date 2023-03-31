class User < ApplicationRecord
    has_and_belongs_to_many :roles
    # has_secure_password

    validates :full_name, :username, :email, :password, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, length: { in: 6..20 }
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    
    def self.active
        where(status: 'active')
    end
    def self.deactive
        where(status: 'deactive')
    end
    def active?
        status == 'active'
    end
    def deactive?
        status == 'deactive'
    end

end