class CreatePlcs < ActiveRecord::Migration[7.0]
  def change
    create_table :plcs do |t|
      t.string :name
      t.string :ip_address

      t.timestamps
    end
  end
end
