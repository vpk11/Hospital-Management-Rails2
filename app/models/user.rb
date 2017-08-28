require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  attr_accessor :password
  #@password ||= Password.new(hashed_password)

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end
  
  
  def role_symbols
    return self.class.name.underscore.to_sym.to_a
    
#    current_user=[]
#    if @user.type.to_s=="Admin"
#        current_user << @user.type.to_s.downcase.to_sym
#    elsif @user.type.to_s=="Doctor"
#      current_user << @user.type.to_s.downcase.to_sym
#    elsif @user.type.to_s=="Patient"
#      current_user << @user.type.to_s.downcase.to_sym
#    end
    
  end
  
end
