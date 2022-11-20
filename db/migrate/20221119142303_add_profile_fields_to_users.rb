class AddProfileFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :address, :string
    add_column :users, :number, :integer
    add_column :users, :zipcode, :string
  end
end
