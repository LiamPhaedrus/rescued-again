class ChangeQuestionsColumnDescription < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :description, :string, null: false
    add_column :questions, :description, :text, null: false
  end
end
