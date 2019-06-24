class CreateInspections < ActiveRecord::Migration[5.2]
  def change
    create_table :inspections do |t|
      t.references :maintenance, foreign_key: true
      t.references :part, foreign_key: true
      t.references :issue, foreign_key: true
      t.references :action, foreign_key: true
      t.references :cause, foreign_key: true
      
      t.timestamps
    end
  end
end
