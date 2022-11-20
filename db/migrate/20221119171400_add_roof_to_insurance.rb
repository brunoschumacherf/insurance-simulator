class AddRoofToInsurance < ActiveRecord::Migration[7.0]
  def change
    add_reference :insurances, :roof
  end
end
