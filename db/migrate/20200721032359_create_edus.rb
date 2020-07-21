class CreateEdus < ActiveRecord::Migration
  def change
    create_table :edus do |t|
      t.string :title
      t.text :content
      t.integer :provider_id
      t.timestamps null: false
    end
  end
end
