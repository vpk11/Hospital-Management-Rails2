class Bed < ActiveRecord::Base
  belongs_to :ward
  has_many :bed_assignments
end
