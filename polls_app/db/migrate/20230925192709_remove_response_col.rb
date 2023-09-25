class RemoveResponseCol < ActiveRecord::Migration[7.0]
  def change
    remove_column :responses, :question_id
  end
end
