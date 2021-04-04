class ChangeDetailsToBusinesses < ActiveRecord::Migration[6.1]
  def change
    change_column :businesses, :number_of_employee, :string
  end
end
