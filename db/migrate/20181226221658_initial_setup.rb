class InitialSetup < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :code
      t.string :title
      t.string :code_type

      t.timestamps
    end

    create_table :causes do |t|
      t.string :code
      t.string :title
      t.string :code_type

      t.timestamps
    end

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

    create_table :issues do |t|
      t.string :code
      t.string :title
      t.string :code_type

      t.timestamps
    end
    
    create_table :parts do |t|
      t.string :description

      t.timestamps
    end

    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.boolean :admin, default: false
      t.string :status, default: "user"

      t.timestamps
    end

    create_table :maintenances do |t|
      t.references :user, foreign_key: true
      t.references :equipment, foreign_key: true
      t.string :status
      t.string :next_maintenance_date
      t.text :notes
      t.string :maintenance_type

      t.timestamps
    end    

    create_table :inspections do |t|
      t.references :maintenances, foreign_key: true
      t.references :part, foreign_key: true
      t.references :issue, foreign_key: true
      t.references :action, foreign_key: true
      t.references :cause, foreign_key: true
      
      t.timestamps
    end  
  end
end
