class MaintenancesSerializer < ActiveModel::Serializer
  attributes :id, :status
  belongs_to :equipment
end
