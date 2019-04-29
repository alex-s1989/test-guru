class DropTableUsersTests < ActiveRecord::Migration[5.2]
  def up
    drop_table :users_tests, if_exists: true
  end
  
  def down
  
  end
end
