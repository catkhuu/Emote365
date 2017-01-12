# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_calendar = Calendar.create(
  user_id: 1,
  name: 'My calendar'
)

images = [
  "http://www.planwallpaper.com/static/images/518169-backgrounds.jpg",
  "http://www.wallpaperscharlie.com/wp-content/uploads/2016/11/Background-Photos-9.jpg",
  "http://www.planwallpaper.com/static/images/824183-green-wallpaper.jpg",
  "http://wallpaper-gallery.net/images/background/background-8.jpg",
  "http://www.wallpaperscharlie.com/wp-content/uploads/2016/11/Background-Photos-8.jpg",
  "http://wallpapercave.com/wp/Ti6qoP7.jpg",
  "http://7-themes.com/data_images/out/18/6830591-background-pictures.jpg",
  "http://tophdimgs.com/data_images/wallpapers/11/361710-css-background.jpg",
  "http://7-themes.com/data_images/out/72/7017449-abstract-colors-background.jpg",
  "http://7-themes.com/data_images/out/76/7032286-abstract-cool-colors-background.jpg"
]

locations = [
  "London",
  'New York',
  'California',
  'Boston',
  'Madrid',
  'Liverpool',
  'Cairo',
  'Berlin',
  'Rome',
  'New York'
]

trends = [
  "stuff",
  "things",
  "dogs",
  "cats",
  "sport stuff",
  "more sport stuff",
  "politics stuff",
  "some other stuff",
  "blah blah blah",
  "beers"
]

start_time = Time.now

10.times do |i|
  Day.create(
    image_url: images[i],
    calendar_id: 1,
    location: locations[i],
    trend_of_day: trends[i],
    created_at: start_time - i * 24 * 60 * 60
  )
end
