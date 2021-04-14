class CreateUsersBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :users_businesses do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
