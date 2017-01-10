module SentimentHelper
  def analyze(text)
    uri = URI('https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment')

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ENV["MICROSOFT_KEY"]
    # Request body
    request.body = {
      "documents": [
        {
          "language": "en",
          "id": "string",
          "text": text
        }
      ]
    }.to_json

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end
  end

  def get_emotions(analysis)
    # breakdown into 10 different emotional indicators 
    score = JSON.parse(analysis.body)["documents"][0]["score"]
    if score < 0.33
      'sad'
    elsif score < 0.66
      'ok'
    else
      'happy'
    end
  end

end
