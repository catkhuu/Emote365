module PixabayHelper
  def get_image(sentiment)
    # response = open('https://pixabay.com/api/?key='+ ENV["PIXA_KEY"] +'&q=' + sentiment + '&image_type=photo').read
    # image = JSON.parse(response)
    # image["hits"].shuffle.sample["webformatURL"]
    binding.pry
    response = open("http://api.pexels.com/v1/search?query=" + sentiment + "&per_page=15&page=1", "Authorization" => ENV["PEXELS_KEY"]).read
    binding.pry
    parsed = JSON.parse(response)
    image = parsed["photos"].shuffle.first["src"]["landscape"]
  end


end
