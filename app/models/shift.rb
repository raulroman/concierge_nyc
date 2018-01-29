class Shift < ApplicationRecord
  has_many :full_time_emplpoyees
  has_many :relief_employess
  belongs_to :building
  

  def self.make_shift_public
    shifts = Shift.where("approved_denied = ?", true).where("claimed_by_employee_id = ?", nil ).where("approved_at > ?", 3.minutes.ago )
  end
end

