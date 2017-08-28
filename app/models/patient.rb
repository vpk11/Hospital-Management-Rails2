class Patient < User

  has_many :appointments
  has_many :doctors, :through => :appointments
  has_many :beds, :through => :bed_assignment

end
