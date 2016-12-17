class RemoveColumnFromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :user_id, :string
    remove_column :answers, :user_id, :string
    remove_column :answers, :question_id, :string
    remove_column :categories, :question_id, :string

  end
end
