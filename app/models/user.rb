class User < ActiveRecord::Base

    has_secure_password
    validates :name, presence: true, uniqueness: true 
    validates :password, presence: true 
    
    has_many :post 
    belongs_to :provider 

end
