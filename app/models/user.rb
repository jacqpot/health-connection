class User < ActiveRecord::Base

    has_secure_password
    validates :name, presence: true
    validates :password, presence: true 
    
    has_many :post 


end
