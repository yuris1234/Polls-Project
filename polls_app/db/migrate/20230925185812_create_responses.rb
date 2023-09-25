class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.bigint :user_id, null:false
      t.bigint :question_id, null:false 
      t.bigint :answer_choice_id, null:false 
      t.timestamps
    end
    add_index :responses, :user_id 
    add_index :responses, :question_id
    add_index :responses, :answer_choice_id
    add_foreign_key :responses, :users, column: :user_id 
    add_foreign_key :responses, :questions, column: :question_id
    add_foreign_key :responses, :answer_choices, column: :answer_choice_id
  end
end
