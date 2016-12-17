class AddPictureToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :picture, :string
  end
end
