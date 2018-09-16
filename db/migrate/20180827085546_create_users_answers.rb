class CreateUsersAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :users_answers do |t|
      t.references :user
      t.references :question
      t.boolean :correct

      t.timestamps
    end
  end
end
