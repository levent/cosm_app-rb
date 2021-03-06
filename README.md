## A sample Cosm Rails App

This app updates a Cosm feed using the [cosm-rb](https://github.com/cosm/cosm-rb) library

View it running at: http://cosm-app-rb.herokuapp.com/

### Get Started

1. Signup for free on [cosm.com](https://cosm.com)
2. Create an api key on Cosm

#### Create a Feed

The *cosm-rb* library makes it easy to convert Ruby objects into Cosm ones.

```ruby
feed = Cosm::Feed.new # initialize a new Feed object
feed.title = "My Cosm Feed"
feed.datastreams = [Cosm::Datastream.new(:id => 'test')] # Let's give it one datastream with id 'test'
```

Let's see what it looks like:
```ruby
feed.to_json
=> {"title":"Test feed","version":"1.0.0","datastreams":[{"id":"test"}]}
```

Let's create the feed on Cosm
```ruby
response = Cosm::Client.post('/v2/feeds.json', :headers => {"X-ApiKey" => YOUR_API_KEY}, :body => feed.to_json)
puts response.headers['location'] # Will give us the location of the Cosm feed including the ID
=> "http://api.cosm.com/v2/feeds/SOMEID"
```

### Further Information

Check out the [API documentation](http://cosm.com/docs/v2/)

### More coming
