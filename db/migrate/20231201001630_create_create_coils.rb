class CreateCreateCoils < ActiveRecord::Migration[7.0]
  def change
    create_table :coils do |t|
      t.integer :address
      t.boolean :state
      t.references :port, null: false, foreign_key: true

      t.timestamps
    end
  end
end
