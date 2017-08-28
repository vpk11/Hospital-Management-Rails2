class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :phone_no
      t.string :username
      t.string :password_salt
      t.string :hashed_password
      t.string :type
      t.references :department

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
