class CreateMetricTables < ActiveRecord::Migration[6.0]
  def change
    create_table :metric_tables do |t|
      t.integer :quick_apply
      t.integer :intentional_apply
      t.integer :info_interview
      t.integer :white_boarding_minutes
      t.integer :portfolio_minutes
      t.integer :user_id

      t.timestamps
    end
  end
end
