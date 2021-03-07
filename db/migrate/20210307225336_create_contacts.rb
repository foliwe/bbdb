class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string   :address
      t.string   :zip_code
      t.string   :phone
      t.string   :mobile
      t.string   :email
      t.belongs_to :location, null: false, foreign_key: true
      t.timestamps
    end
  end
end
