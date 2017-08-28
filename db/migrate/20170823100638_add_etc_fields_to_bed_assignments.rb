class AddEtcFieldsToBedAssignments < ActiveRecord::Migration
  def self.up
    add_column :bed_assignments, :start_time, :datetime
    add_column :bed_assignments, :end_time, :datetime
  end

  def self.down
    remove_column :bed_assignments, :start_time
    remove_column :bed_assignments, :end_time
  end
end
