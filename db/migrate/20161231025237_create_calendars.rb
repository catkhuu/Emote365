class CreateCalendars < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
      t.references :user
      t.name :varchar, default: 'My calendar'
      t.type :varchar, null: false

      t.timestamps(null: false)
    end
  end
end
