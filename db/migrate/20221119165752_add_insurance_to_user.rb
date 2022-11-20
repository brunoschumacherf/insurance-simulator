class AddInsuranceToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :insurance
  end
end
