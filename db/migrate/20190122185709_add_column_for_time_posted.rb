class AddColumnForTimePosted < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :posted_at, :timestamp
  end
end
