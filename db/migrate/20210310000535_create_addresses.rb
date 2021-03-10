class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :continent
      t.string :country
      t.string :city
      t.string :zip_code
      t.string :email
      t.string :phone
      t.belongs_to :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
