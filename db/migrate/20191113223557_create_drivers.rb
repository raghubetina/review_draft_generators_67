class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.date :hired_on

      t.timestamps
    end
  end
end
