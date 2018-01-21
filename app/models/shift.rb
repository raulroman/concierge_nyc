class Shift < ApplicationRecord
  has_many :full_time_emplpoyees
  has_many :relief_employess
  has_many :buildings
  

  def self.make_shift_public
    shifts = Shift.where(approved_denied: true).where(claimed_by_employee_id: nil ).where("approved_at < ?", 1.hour.ago )
  end
end




