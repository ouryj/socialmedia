class AnotherTable < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :post_id
     
    end
    
  end
end