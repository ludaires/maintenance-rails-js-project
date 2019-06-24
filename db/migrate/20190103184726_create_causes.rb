class CreateCauses < ActiveRecord::Migration[5.2]
  def change
    create_table :causes do |t|
      t.string :code
      t.string :title
      t.string :code_type

      t.timestamps
    end
  end
end
