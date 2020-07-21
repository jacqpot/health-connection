class Provider < ActiveRecord::Base
    has_secure_password
    validates :name, presence: true, uniqueness: true 
    validates :title, presence: true 
    validates :password, presence: true 
    
    has_many :post 
end
