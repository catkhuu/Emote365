module PixabayHelper
  def get_image(sentiment)
    response = open('https://pixabay.com/api/?key='+ ENV["PIXA_KEY"] +'&q=' + sentiment + '&image_type=photo').read
    image = JSON.parse(response)
    image["hits"].shuffle.sample["webformatURL"]
  end
end
