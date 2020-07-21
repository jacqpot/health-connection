class Edu < ActiveRecord::Base
    belongs_to :provider  
    validates :title, presence: true 
    validates :content, presence: true 
end
