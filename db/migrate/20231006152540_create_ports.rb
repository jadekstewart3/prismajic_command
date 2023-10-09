class CreatePorts < ActiveRecord::Migration[7.0]
  def change
    create_table :ports do |t|
      t.string :description
      t.integer :port_number
      t.references :plc, null: false, foreign_key: true

      t.timestamps
    end
  end
end
