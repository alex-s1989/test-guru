class AddAuthorRefToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author, foreign_key: { to_table: :users }
    # remove_column :tests, :user_id, :integer
    # remove_column :tests, :test_author_id, :integer
  end
end
