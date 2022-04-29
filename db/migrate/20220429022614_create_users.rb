class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamps
      t.references :company, null: false, foreign_key: true
      t.index :email, unique: true
    end
  end
end
