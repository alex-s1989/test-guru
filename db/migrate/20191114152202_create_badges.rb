class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :file_name
      t.string :rule_name, null: false
      t.string :rule_value
      
      t.timestamps
    end

    add_index :badges, %i[rule_name rule_value], unique: true
  end
end
