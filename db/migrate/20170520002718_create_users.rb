class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :nickname, null: false
      t.string :name, null: false
      t.string :email
      t.string :avatar_url, null: false


      t.timestamps null: false
    end
    add_index :users, :uid, unique: true
  end
end
