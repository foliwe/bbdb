class AddDetailsToBusinesses < ActiveRecord::Migration[6.1]
  def change
    add_column :businesses, :founded, :date
    add_column :businesses, :ceo, :string
  end
end
