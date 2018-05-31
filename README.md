# AuspostApiClient

Ruby gem for the Australia Post APIs. Currently not finished but it does support calculating shipping costs. 

# Usage

    require 'auspost_api_client'
	aus_post_client = AuspostApiClient::Client.new(<api_key>)
	shipping_response = aus_post_client.postage.parcel.domestic.calculate(
	    <from_postcode>,
		<to_postcode>,
		<length>,
		<width>,
		<height>,
		<weight>,
		<service_code>
	)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
