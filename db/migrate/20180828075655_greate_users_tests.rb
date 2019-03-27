class GreateUsersTests < ActiveRecord::Migration[5.2]
  def change
    create_table :users_tests do |t|
      t.references :test, :user, foreign_key: true
    
      t.timestamps
    end
  end
end
