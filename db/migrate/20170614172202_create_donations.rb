class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.string :author
      t.string :message
      t.decimal :amount
      t.references :campaign

      t.timestamps
    end
  end
end
