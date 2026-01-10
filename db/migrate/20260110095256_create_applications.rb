class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :company_name
      t.string :job_title
      t.integer :status
      t.date :applied_at
      t.string :job_url

      t.timestamps
    end
  end
end
