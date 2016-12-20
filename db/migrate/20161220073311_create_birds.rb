class CreateBirds < ActiveRecord::Migration[5.0]
  def change
    create_table :birds do |t|
      t.string :title

      t.timestamps
    end
  end
end
