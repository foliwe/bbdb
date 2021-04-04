class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.text :job_description
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
