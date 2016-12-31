class CreateTrends < ActiveRecord::Migration[5.0]
  def change
    create_table :trends do |t|
      t.string :hashtag, null: false
      t.references :day, null: false

      t.timestamps(null: false)
    end
  end
end
