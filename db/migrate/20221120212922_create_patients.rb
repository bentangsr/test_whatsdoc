class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :weight
      t.string :height
      t.timestamps
    end
  end
end
