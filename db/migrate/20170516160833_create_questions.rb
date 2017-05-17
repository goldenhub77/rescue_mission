class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false, length: { minimum: 20 }
      t.text :description, null: false, length: { minimum: 50 }

      t.timestamps null: false
    end
  end
end
