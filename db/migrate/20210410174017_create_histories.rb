class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.string :author
      t.text :description
      t.string :life

      t.timestamps
    end
  end
end
