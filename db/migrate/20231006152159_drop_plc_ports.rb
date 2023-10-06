class DropPlcPorts < ActiveRecord::Migration[7.0]
  def change
    drop_table :plc_ports
  end
end
