class AddAuthorRefToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :test_author, foreign_key: { to_table: :users }
    remove_column :tests, :user_id, :integer
    
  end
end
