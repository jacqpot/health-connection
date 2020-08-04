class User < ActiveRecord::Base

    has_secure_password
    validates :name, presence: true, uniqueness: true 
    validates :password, presence: true 
    validates :provider_id, presence: true 
    has_many :post 
    has_many :apointment 
    belongs_to :provider 

end