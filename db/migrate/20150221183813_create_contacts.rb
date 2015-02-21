class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :lastname
      t.integer :phone
      t.string :email
      t.text :description
      t.date :birthdate
      t.integer :user_id

      t.timestamps
    end
  end
end
