class UsersController < ApplicationController
  before_filter :check_logged_in, :only=>[:index]
  def index
    
  end



  def login



    @user = User.first(:conditions => ["username = ?", params[:user_login][:username]])
    hash = @user.hashed_password
    hash = BCrypt::Password.new(hash)
    


    if hash == params[:user_login][:password]
      session[:current_user_id] = @user.id
     
        if @user.type.to_s=="Doctor"

            redirect_to doctors_path


        elsif @user.type.to_s=="Patient"

            redirect_to patients_path
            

        elsif @user.type.to_s=="Admin"

            redirect_to admins_path

        end


      else
         redirect_to users_url
       end




  end


  def logout

    session[:current_user_id] = nil
    redirect_to users_path

  end

  private

    def check_logged_in

        if session[:current_user_id].present?
      
          @user=User.find(session[:current_user_id])

          if @user.type.to_s=="Admin"
            redirect_to admins_path

          elsif @user.type.to_s=="Doctor"
            redirect_to doctors_path

          elsif @user.type.to_s=="Patient"
        
            redirect_to patients_path

          end

        end

  end





end
