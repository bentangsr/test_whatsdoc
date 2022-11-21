class CreateClinics < ActiveRecord::Migration[7.0]
  def change
    create_table :clinics do |t|
      t.references :user, index: true
      t.string  :name
      t.text :address
      t.string :phone
      t.string :email
      t.timestamps
    end
  end
end
