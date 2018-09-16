class GreateUsersTests < ActiveRecord::Migration[5.2]
  def change
    create_table :users_tests do |t|
      t.references :test, :user
    
      t.timestamps
    end
  end
end
