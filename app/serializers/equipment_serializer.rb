class EquipmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :location, :uncertainty, :calibration_unit
  has_many :maintenances
end
