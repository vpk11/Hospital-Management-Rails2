class BedAssignment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :bed
  
  
  def self.available_bed(start_time,end_time,ward_id)
      
     
     #bed_assignments=BedAssignment.all(:conditions =>["(start_time > ? and start_time < ?) OR (end_time > ? and end_time < ?) OR (start_time < ? and end_time > ?)",start_time,end_time,start_time,end_time,start_time,end_time ])
     bed_assignments=BedAssignment.all(:conditions =>["(start_time BETWEEN ? AND ? ) OR (end_time BETWEEN ? AND ?)",start_time,end_time,start_time,end_time ])
     bed_ids=bed_assignments.collect(&:bed_id).uniq
     
     if bed_ids.present?
      puts "*********************************   Bed Ids Present   ****************************************"
      available=Bed.all(:conditions => ["ward_id = ? and id NOT IN (?)",ward_id.to_i,bed_ids])
     else
      puts "*********************************   Bed Ids Not Present   *************************************"
      available=Bed.all(:conditions => ["ward_id = ?",ward_id.to_i])  
     end
     puts"__________________________Available = #{available}__________________________________"
     return available
     
  end
  
  
end
