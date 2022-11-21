class CreateRoofs < ActiveRecord::Migration[7.0]
  def change
    create_table :roofs do |t|
      t.string :name
      t.float :factor
      t.references :insurance, index: true

      t.timestamps
    end
  end
end
