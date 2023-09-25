class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.bigint :author_id, null: false
      t.timestamps
    end
    add_index :polls, :author_id, unique: true
    add_foreign_key :polls, :users, column: :author_id
  end
end
