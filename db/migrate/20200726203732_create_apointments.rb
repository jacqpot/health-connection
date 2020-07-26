class CreateApointments < ActiveRecord::Migration
  def change
    create_table :apointments do |t|
      t.string :date_and_time 
      t.string :reason
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
