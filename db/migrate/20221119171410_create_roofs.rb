class CreateRoofs < ActiveRecord::Migration[7.0]
  def change
    create_table :roofs do |t|
      t.string :name
      t.float :factor

      t.timestamps
    end
  end
end
