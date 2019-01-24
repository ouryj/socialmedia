class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.timestamp :posted_at
      t.references :user 
      

    end
  end
end
