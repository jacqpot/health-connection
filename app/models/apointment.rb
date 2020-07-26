class Apointment < ActiveRecord::Base
    belongs_to :user   
    validates :reason, presence: true 
    validates :date_and_time, presence: true 
end
