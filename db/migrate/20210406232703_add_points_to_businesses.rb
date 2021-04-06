class AddPointsToBusinesses < ActiveRecord::Migration[6.1]
  def change
    add_column :businesses, :point, :integer ,default: 1
  end
end
