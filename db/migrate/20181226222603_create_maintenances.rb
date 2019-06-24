class CreateMaintenances < ActiveRecord::Migration[5.2]
  def change
    create_table :maintenances do |t|
      t.references :user, foreign_key: true
      t.references :equipment, foreign_key: true
      t.string :status
      t.string :next_maintenance_date
      t.text :notes
      t.string :maintenance_type

      t.timestamps
    end
  end
end
