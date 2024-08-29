# AusPost API Client

Ruby gem for the Australia Post APIs. Currently not finished but it does support calculating shipping costs. 

# Install

Add to Gemfile

```ruby
gem 'auspost_api_client', git: 'https://github.com/red-ant/auspost_api_client'
```

# Usage

```ruby
require 'auspost_api_client'

aus_post_client = AuspostApiClient::Client.new(<your_api_key>)

shipping_response = aus_post_client.postage.parcel.domestic.calculate(
  <from_postcode>,
  <to_postcode>,
  <length>,
  <width>,
  <height>,
  <weight>,
  <service_code>
)

# total in Australian Dollars
shipping_response.total_cost.to_f
```

# Auspost API

## Documentation

* https://developers.auspost.com.au/apis/pac/reference
* https://developers.auspost.com.au/apis/pac/reference/postage-parcel-domestic-calculate
* https://developers.auspost.com.au/apis/pac/reference/postage-parcel-international-calculate

## Example calculate domestic parcel shipping costs

```
GET https://digitalapi.auspost.com.au/postage/parcel/domestic/calculate.json?from_postcode=5000&to_postcode=2914&length=21.0&width=14.8&height=1.99&weight=0.492&service_code=AUS_PARCEL_REGULAR

{
  "postage_result": {
    "service": "Parcel Post",
    "delivery_time": "Delivered in 2-4 business days",
    "total_cost": "10.95",
    "costs": {
      "cost": {
        "item": "Parcel Post",
        "cost": "10.95"
      }
    }
  }
}
```

# Run tests

```bash
API_KEY=<your_api_key> rake test
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
