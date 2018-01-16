class Building < ApplicationRecord
  has_many :full_time_employees
  has_many :relief_employees
  belongs_to :resident_manager
end
