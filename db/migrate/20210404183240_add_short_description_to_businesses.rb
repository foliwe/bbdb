class AddShortDescriptionToBusinesses < ActiveRecord::Migration[6.1]
  def change
    add_column :businesses, :about_text, :string
  end
end
