class RemoveUniqueFromPolls < ActiveRecord::Migration[7.0]
  def change
    remove_index :questions, :poll_id
    add_index :questions, :poll_id
  end
end
