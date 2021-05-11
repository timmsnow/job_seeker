class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :company_name
      t.string :position
      t.text :description
      t.string :status
      t.integer :salary
      t.string :posting_url
      t.text :notes
      t.string :date_updated

      t.timestamps
    end
  end
end
