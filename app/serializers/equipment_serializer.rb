class EquipmentSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :maintenances
end
