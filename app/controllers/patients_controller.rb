class PatientsController < ApplicationController

  layout "profile_layout" , :only => [:index , :show]
  layout "patient_layout", :only => [:get_appointments,:index]
  filter_access_to :all


  def index

    @patient=Patient.find(session[:current_user_id])
    @appointments=@patient.appointments
    @doctor=Doctor.all
    

  end

  def new
  end

  def edit
    @patient=Patient.find(params[:id])
    @user=User.find(session[:current_user_id])
  end

  def update

    @patient = Patient.find(params[:id])
    if @patient.update_attributes(params[:patient])
        flash[:notice] = 'Patient was successfully updated.'
        redirect_to show_patients_admins_path
    else
        render edit_admin_patient
    end

  end

  def create

    @patient=Patient.new(params[:patient_signup])

    if @patient.save
        flash[:notice] = 'Patient Created SuccessFully'
        redirect_to show_patients_admins_path


    else
      render new_patient_path
    end


  end

  def destroy

    @patient = Patient.find(params[:id])
    @patient.destroy
    flash[:notice] = 'Deleted SuccessFully'
    redirect_to show_patients_admins_path

  end
  def show

    @patient = Patient.find(params[:id])
    
  end

  def get_appointments
      #@doctor=Doctor.all
      @department=Department.all
       
  end

  def list_doctors
    puts "Inside List Doctors Function"
    #@patient = Patient.find(session[:current_user_id])
    start_time=DateTime.new(params["start_time_1i"].to_i,params["start_time_2i"].to_i,params["start_time_3i"].to_i,params["start_time_4i"].to_i,params["start_time_5i"].to_i)
    end_time=DateTime.new(params["end_time_1i"].to_i,params["end_time_2i"].to_i,params["end_time_3i"].to_i,params["end_time_4i"].to_i,params["end_time_5i"].to_i)
    department_id=params[:department_id]
    @department=Department.all
    
    @available_doctors=Appointment.available_doctor(start_time,end_time,department_id)
    
   render :update do |page|
      page.replace_html 'available_doctors' ,:partial =>'available_doctors'
   end 
    
  end

  def create_appointment
    @patient = Patient.find(session[:current_user_id])
    @doctor=Doctor.find(params[:get_appointment][:doctor_id])
    start_time=DateTime.new(params[:get_appointment]["start_time(1i)"].to_i,params[:get_appointment]["start_time(2i)"].to_i,params[:get_appointment]["start_time(3i)"].to_i,params[:get_appointment]["start_time(4i)"].to_i,params[:get_appointment]["start_time(5i)"].to_i)
    end_time=DateTime.new(params[:get_appointment]["end_time(1i)"].to_i,params[:get_appointment]["end_time(2i)"].to_i,params[:get_appointment]["end_time(3i)"].to_i,params[:get_appointment]["end_time(4i)"].to_i,params[:get_appointment]["end_time(5i)"].to_i)

    @appointment = @patient.appointments.build(params[:get_appointment])
    if @appointment.save
      flash[:notice] = 'Appointment Created.'
      redirect_to patients_path
    else             
      render get_appointments_patients_path
    end

  end


end
