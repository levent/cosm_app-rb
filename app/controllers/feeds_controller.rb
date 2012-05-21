class FeedsController < ApplicationController
  def update
    response = Cosm::Client.put('/v1/feeds/59784/datastreams/demo.csv', :headers => {"X-ApiKey" => COSM_API_KEY}, :body => params[:current_value])
    redirect_to root_path
  end
end
