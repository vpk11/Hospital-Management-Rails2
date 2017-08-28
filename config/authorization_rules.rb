authorization do
  role :admin do
    has_permission_on :admins, :to=>[:index, :show_doctors, :show_patients, :new_bed_assignment, :list_beds, :create_bed_assignment,:destroy_bed_assignment, :manage_bed_assignments, :show_wards,:show_beds, :destroy_bed, :new_ward, :create_ward, :destroy_ward, :new_bed, :create_bed, :show_departments, :new_department, :create_department, :manage_appointments, :destroy_appointment]
    has_permission_on :doctors, :to=>[:create,:edit,:update,:destroy,:show,:new]
    has_permission_on :patients, :to=>[:new,:edit,:update,:create,:destroy,:show,:get_appointments,:list_doctors,:create_appointment]
    has_permission_on :users, :to=>[:logout,:check_logged_in]
  end
  
  role :patient do
    has_permission_on :patients, :to=>[:index,:show, :get_appointments, :list_doctors, :create_appointment]
    has_permission_on :users, :to=>[:logout]
  end
  
  role :doctor do
    has_permission_on :doctors, :to=>[:index,:create, :show]
    has_permission_on :users, :to=>[:logout]
  end
  
  role :user do
    has_permission_on :users, :to=>[:login, :logout, :check_logged_in]
  end
  
  
end