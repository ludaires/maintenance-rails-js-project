class Equipment < ApplicationRecord
    has_many :maintenances
    has_many :users, through: :maintenances

    scope :ordered_by_next_maintenance, -> { joins(:maintenances).where('next_maintenance_date')}

    def in_progress? 
        @status = []
        self.maintenances.each do |m|  
            @status << m.status 
        end
        @status.include?("In progress")
    end
end


















