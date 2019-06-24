class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :code
      t.string :location
      t.string :calibration_unit
      t.string :calibration_start
      t.string :calibration_end
      t.string :uncertainty

      t.timestamps
    end
  end
end
