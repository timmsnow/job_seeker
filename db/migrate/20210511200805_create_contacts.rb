class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.integer :job_id
      t.string :name
      t.string :email
      t.string :job_title
      t.string :linkedin_url
      t.string :phone
      t.string :date_contacted

      t.timestamps
    end
  end
end
