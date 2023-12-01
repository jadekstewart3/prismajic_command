class AddAddress2Ports < ActiveRecord::Migration[7.0]
  def change
    add_column :ports, :address, :integer, null: false
  end
end
