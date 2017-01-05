class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.references :calendar
      t.string :image_url
      t.string :location, null: false
      t.string :trend_of_day

      t.timestamps(null: false)
    end
  end
end
