class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :business_name
      t.text    :description
      t.string  :website
      t.belongs_to :user, null: false, foreign_key: true
      t.string  :business_email
      t.integer :number_of_employee
      t.boolean :accepts_partnership , default: false
      t.boolean :verified, default: false
      t.timestamps
    end
  end
end
