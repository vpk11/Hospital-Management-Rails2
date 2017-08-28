class AdminsController < ApplicationController
  layout "doc_patient_layout", :only => [:index, :new_bed, :show_doctors, :show_patients, :show_wards, :show_beds, :show_departments, :new_bed_assignment, :manage_appointments, :manage_bed_assignments]
  filter_access_to :all
  
  def index

      @doctor=Doctor.all
      @patient=Patient.all
      @ward=Ward.all
      @bed=Bed.all

  end

  def show_doctors
    @doctor=Doctor.all
    @user=User.find(session[:current_user_id])
  end

  def show_patients
    @patient=Patient.all
    @user=User.find(session[:current_user_id])
  end

 def manage_appointments
   @appointments=Appointment.all
   @user=User.find(session[:current_user_id])
 end
  

 
 def new_bed_assignment
   @patient=Patient.all
   @ward=Ward.all
 end
 
 
 def list_beds
   start_time=DateTime.new(params["start_time_1i"].to_i,params["start_time_2i"].to_i,params["start_time_3i"].to_i,params["start_time_4i"].to_i,params["start_time_5i"].to_i)
   end_time=DateTime.new(params["end_time_1i"].to_i,params["end_time_2i"].to_i,params["end_time_3i"].to_i,params["end_time_4i"].to_i,params["end_time_5i"].to_i)
   ward_id=params[:ward_id]
   puts "---------------------------Ward ID #{ward_id}--------------------------------"
   @available_beds=BedAssignment.available_bed(start_time,end_time,ward_id)
   puts "-----------------------------*#{@available_beds}*-----------------------------------"
   render :update do |page|
      page.replace_html 'available_beds' ,:partial =>'available_beds'
    end
 
 end

 def create_bed_assignment

   @bed=Bed.find(params[:new_bed][:bed_id])
   start_time=DateTime.new(params[:new_bed]["start_time(1i)"].to_i,params[:new_bed]["start_time(2i)"].to_i,params[:new_bed]["start_time(3i)"].to_i,params[:new_bed]["start_time(4i)"].to_i,params[:new_bed]["start_time(5i)"].to_i)
   end_time=DateTime.new(params[:new_bed]["end_time(1i)"].to_i,params[:new_bed]["end_time(2i)"].to_i,params[:new_bed]["end_time(3i)"].to_i,params[:new_bed]["end_time(4i)"].to_i,params[:new_bed]["end_time(5i)"].to_i)
   @bed_assignment = @bed.bed_assignments.build(params[:new_bed])
   if @bed_assignment.save
        puts "***************************************SAVED************************************************************"
         flash[:notice] = 'Assigned successfully.'
        redirect_to admins_path 
      

   else
     puts "***************************************CONDITION FALSE************************************************************"
     flash[:notice] = 'Error successfully.'
    render create_bed_assignment_admins_path  

  end
 end
 
 def manage_bed_assignments
   
   @bed_assignments=BedAssignment.all
   @user=User.find(session[:current_user_id])
   
   
 end

 def show_wards
   @ward=Ward.all
   @user=User.find(session[:current_user_id])
 end

 def show_beds
   @ward=Ward.find(params[:id])
   @bed=Bed.find_all_by_ward_id(@ward.id)
 end

 def destroy_bed
   @bed = Bed.find(params[:id])
   @bed.destroy
   flash[:notice] = 'Deleted SuccessFully'
   redirect_to show_beds_admins_path
 end

 def new_ward
   @user=User.find(session[:current_user_id])
 end

 def create_ward
   @ward=Ward.new(params[:new_ward_form])

   if @ward.save

       puts "---------------------------SuccessFully Saved Ward-----------------------------------"
       flash[:notice] = 'Ward Created Successfully.'
       redirect_to show_wards_admins_path
   else
     render new_ward_admins_path
   end

 end

 def destroy_ward

   @ward = Ward.find(params[:id])
   @ward.destroy
   flash[:notice] = 'Deleted SuccessFully'
   redirect_to show_wards_admins_path

 end

 def new_bed
   @ward=Ward.all
 end

 def create_bed

   @bed=Bed.new(params[:new_bed_form])

   if @bed.save

       puts "---------------------------SuccessFully Saved Ward-----------------------------------"
        flash[:notice] = 'Bed Created successfully.'
       redirect_to new_bed_admins_path
   else
     flash[:notice] = 'Error Occured.'
     render new_bed_admins_path
   end

 end


 def show_departments
   @department=Department.all
 end

 def new_department

 end

 def create_department
   @department=Department.new(params[:new_department_form])

   if @department.save
       flash[:notice] = 'Department created sucessfully.'
       puts "---------------------------SuccessFully Saved Ward-----------------------------------"
       redirect_to  show_departments_admins_path
   else
     render new_department_admins_path
   end

 end
 
 def destroy_appointment
   
   @appointment = Appointment.find(params[:id])
   @appointment.destroy
   flash[:notice] = 'Deleted SuccessFully'
   redirect_to manage_appointments_admins_path
   
 end
 
 def destroy_bed_assignment
   
   @bed_assignment = BedAssignment.find(params[:id])
   @bed_assignment.destroy
   flash[:notice] = 'Deleted SuccessFully'
   redirect_to manage_bed_assignments_admins_path
   
 end



 end