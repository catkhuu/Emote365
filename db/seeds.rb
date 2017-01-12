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
  "http://www.intrawallpaper.com/static/images/Desktop-Wallpaper-HD5_or6ZJ13.jpg",
  "http://www.wallpaperscharlie.com/wp-content/uploads/2016/11/Background-Photos-8.jpg",
  "http://wallpapercave.com/wp/Ti6qoP7.jpg",
  "http://www.intrawallpaper.com/static/images/303836_pN35c8V.jpg",
  "https://i.ytimg.com/vi/A7ZkZazfvao/maxresdefault.jpg",
  "http://cartoonbros.com/wp-content/uploads/2016/08/wallpaper-hd-11-1024x640.jpg",
  "http://cartoonbros.com/wp-content/uploads/2016/08/wallpaper-hd-16-1024x576.jpg"
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

Day.all.destroy_all

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
