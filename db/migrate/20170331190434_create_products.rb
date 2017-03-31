class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :sport_id 
      t.integer :user_id
      t.string :product_name 
      t.text :product_description      
      
      t.timestamps
    end
  end
end
