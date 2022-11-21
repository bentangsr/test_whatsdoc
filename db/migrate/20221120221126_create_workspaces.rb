class CreateWorkspaces < ActiveRecord::Migration[7.0]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.string :code
      t.string :address
      t.references :country, index: true
      t.timestamps
    end
  end
end
