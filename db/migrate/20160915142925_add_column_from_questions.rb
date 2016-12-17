class AddColumnFromQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :user_id, :integer
    add_column :answers, :user_id, :integer
    add_column :answers, :question_id, :integer
    add_column :categories, :question_id, :integer
  end
end