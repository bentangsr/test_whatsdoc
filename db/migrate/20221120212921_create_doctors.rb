class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.references :specialist, index: true
      t.references :workspace, index: true
      t.float :chat_price
      t.float :phone_price
      t.float :video_price
      t.timestamps
    end
  end
end
