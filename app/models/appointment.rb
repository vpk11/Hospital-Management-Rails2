class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  
  
  def self.available_doctor(start_time,end_time,department_id)
    
     #appointments=Appointment.all(:conditions =>["(start_time > ? and start_time < ?) OR (end_time > ? and end_time < ?) OR (start_time < ? and end_time > ?)",start_time,end_time,start_time,end_time,start_time,end_time ])
     appointments=Appointment.all(:conditions =>["(start_time BETWEEN ? AND ? ) OR (end_time BETWEEN ? AND ?)",start_time,end_time,start_time,end_time ])
     doctor_ids=appointments.collect(&:doctor_id).uniq
     
     if doctor_ids.present?
       puts "*********************************   Doctor_ids Ids Present   ****************************************"
       available=Doctor.all(:conditions => ["department_id = ? and id NOT IN (?)",department_id,doctor_ids])
     else
       puts "*********************************   Doctor Ids NotPresent   ****************************************"
       available=Doctor.all(:conditions => ["department_id = ?",department_id])
     end
     return available
     
  end
  
end
