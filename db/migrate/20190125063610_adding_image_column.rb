class AddingImageColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :images, :binary  
  end
end
