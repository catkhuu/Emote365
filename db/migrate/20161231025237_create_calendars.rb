class CreateCalendars < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
      t.references :user
      t.string :name, default: 'My calendar'

      t.timestamps(null: false)
    end
  end
end
