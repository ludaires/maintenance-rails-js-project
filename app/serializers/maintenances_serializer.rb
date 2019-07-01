class MaintenancesSerializer < ActiveModel::Serializer
  attributes :id, :status, :maintenance_type
  belongs_to :equipment
end
