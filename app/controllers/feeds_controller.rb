class FeedsController < ApplicationController
  def update
    get_response = Cosm::Client.get('/v1/feeds/59784/datastreams/plus_one.csv', :headers => {"X-ApiKey" => COSM_API_KEY})
    plus_one = get_response.body.to_i + 1
    response = Cosm::Client.put('/v1/feeds/59784/datastreams/plus_one.csv', :headers => {"X-ApiKey" => COSM_API_KEY}, :body => plus_one.to_s)
    redirect_to root_path
  end
end
