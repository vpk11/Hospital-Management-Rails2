class Doctor < User

  belongs_to :department
  has_many :appointments
  has_many :patients, :through => :appointments
  has_one :doctor_detail

  

end
