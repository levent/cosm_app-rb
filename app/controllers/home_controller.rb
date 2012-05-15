class HomeController < ApplicationController
  def index
    response = HTTParty.get('http://api.cosm.com/v2/feeds/59784.json', :headers => {"X-ApiKey" => COSM_API_KEY})
    @feed = Feed.new(response.body)
  end
end
