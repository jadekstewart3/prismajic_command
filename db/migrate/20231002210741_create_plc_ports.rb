class CreatePlcPorts < ActiveRecord::Migration[7.0]
  def change
    create_table :plc_ports do |t|
      t.string :name
      t.string :ip_address
      t.integer :port

      t.timestamps
    end
  end
end
