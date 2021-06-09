class RenameColumnFromMetricTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :metric_tables, :quick_apply, :apply
    rename_column :metric_tables, :intentional_apply, :breaks
  end
end
