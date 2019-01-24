class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.text :email
      t.text :username
      t.text :password
      t.datetime :Birthday
      t.datetime :created_at
      t.datetime :updated_at
      
    end
  end
end
