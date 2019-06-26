class EquipmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :location, :calibration_unit, :calibration_start, :calibration_end, :uncertainty
  has_many :maintenances
end
