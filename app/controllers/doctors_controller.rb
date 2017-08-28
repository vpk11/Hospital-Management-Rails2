class DoctorsController < ApplicationController
  
  layout "profile_layout" , :only => [:index , :show]
  layout "patient_layout", :only => [:index]
  
  
  filter_access_to :all

  def index

    @doctor=Doctor.find(session[:current_user_id])
    @appointments=@doctor.appointments
    @patient=Patient.all


  end

  def new
    @departments=Department.all
  end

  def create

    @doctor=Doctor.new(params[:doctor_signup])

    if @doctor.save
        flash[:notice] = 'Doctor was successfully Created.'
       
        redirect_to show_doctors_admins_path


    else
      render new_doctor_path
    end


  end

  def edit
    @user=User.find(session[:current_user_id])
    @doctor=Doctor.find(params[:id])
  end

  def update

    @doctor = Doctor.find(params[:id])
    if @doctor.update_attributes(params[:doctor])
        flash[:notice] = 'Doctor was successfully updated.'
        redirect_to show_doctors_admins_path
    else
        render edit_admin_doctor_path
    end

  end


  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    flash[:notice] = 'Deleted SuccessFully'
    redirect_to show_doctors_admins_path
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

end
