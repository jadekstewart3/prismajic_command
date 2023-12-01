class RemoveAddressFromPorts < ActiveRecord::Migration[7.0]
  def change
    remove_column :ports, :address, :string
  end
end
