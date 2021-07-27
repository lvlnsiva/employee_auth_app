class Employee < ApplicationRecord
  validates_presence_of :name, :emp_id, :designation, :qualificaton, :from_date
end
