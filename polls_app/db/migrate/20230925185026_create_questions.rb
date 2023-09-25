class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.bigint :poll_id, null: false
      t.timestamps
    end
    add_index :questions, :poll_id, unique: true 
    add_foreign_key :questions, :polls, column: :poll_id
  end
end
