class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.references :calendar
      t.varchar :image_url, null: false
      t.varchar :location, null: false
      t.varchar :trend_of_day

      t.timestamps(null: false)
    end
  end
end
