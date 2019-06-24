class Maintenance < ApplicationRecord
  belongs_to :user
  belongs_to :equipment
  has_many :inspections, inverse_of: :maintenance
 
  accepts_nested_attributes_for :inspections
  validates :next_maintenance_date, :status, :maintenance_type, presence: :true

  scope :ordered_by_next_maintenance, -> { order(next_maintenance_date: :desc).limit(5)}

  #show first all maintenance in progress

end
