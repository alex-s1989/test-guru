class GreateUserTests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tests do |t|
      t.references :tests, :users
    
      t.timestamps
    end
  end
end
