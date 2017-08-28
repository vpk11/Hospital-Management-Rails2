class CreateBedAssignments < ActiveRecord::Migration
  def self.up
    create_table :bed_assignments do |t|
      t.references :patient
      t.references :bed

      t.timestamps
    end
  end

  def self.down
    drop_table :bed_assignments
  end
end
