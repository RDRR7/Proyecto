class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :description
      t.string :review
      t.decimal :goal
      t.string :category
      t.string :image_url
      t.references :user
      t.integer :likes
      t.date :end

      t.timestamps
    end
  end
end
