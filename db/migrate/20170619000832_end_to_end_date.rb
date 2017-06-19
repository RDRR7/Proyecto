class EndToEndDate < ActiveRecord::Migration[5.0]
  def change
  	rename_column :campaigns, :end, :end_date
  end
end
