## A sample Cosm Rails App

This app updates a Cosm feed using [httparty](https://github.com/jnunemaker/httparty) and the [pachube_data_formats](https://github.com/pachube/pachube_data_formats) project

View it running at: http://cosm-app-rb.herokuapp.com/

### Get Started

1. Signup for free on [cosm.com](https://cosm.com)
2. Create an api key on Cosm

#### Create a Feed

The *pachube_data_formats* library makes it easy to convert Ruby objects into Cosm ones.

```ruby
feed = PachubeDataFormats::Feed.new # initialize a new Feed object
feed.title = "My Cosm Feed"
feed.datastreams = [PachubeDataFormats::Datastream.new(:id => 'test')] # Let's give it one datastream with id 'test'
```

Let's see what it looks like:
```json
# feed.to_json
{"title":"Test feed","version":"1.0.0","datastreams":[{"id":"test"}]}
```

*httparty* makes it easy to make API requests.

Let's create the feed on Cosm
```ruby
response = HTTParty.post('http://api.cosm.com/v2/feeds.json', :headers => {"X-ApiKey" => YOUR_API_KEY}, :body => feed.to_json)
puts response.headers['location'] # Will give us the location of the Cosm feed including the ID
=> "http://api.cosm.com/v2/feeds/SOMEID"
```

### Further Information

Check out the [API documentation](http://cosm.com/docs/v2/)

### More coming
