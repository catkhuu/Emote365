module PixabayHelper
  def get_image(sentiment)
    response = open("http://api.pexels.com/v1/search?query=" + sentiment + "&per_page=15&page=1", "Authorization" => ENV["PEXELS_KEY"]).read
    parsed = JSON.parse(response)
    image = parsed["photos"].shuffle.first["src"]["landscape"]
  end
end
