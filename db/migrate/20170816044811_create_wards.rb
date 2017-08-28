class CreateWards < ActiveRecord::Migration
  def self.up
    create_table :wards do |t|
      t.string :name
      t.integer :bed_space

      t.timestamps
    end
  end

  def self.down
    drop_table :wards
  end
end
