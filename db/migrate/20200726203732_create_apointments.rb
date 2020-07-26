class CreateApointments < ActiveRecord::Migration
  def change
    create_table :apointments do |t|

      t.timestamps null: false
    end
  end
end
