require "test_helper"

class AuspostApiClientTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::AuspostApiClient::VERSION
  end

  def test_it_can_initialize_client
    AuspostApiClient::Client.new(ENV["API_KEY"])
  end

  def test_it_can_list_countries
    client = AuspostApiClient::Client.new(ENV["API_KEY"])
    client.postage.countries.length > 10
  end

  def test_it_can_calculate_postage_parcel_international
    client = AuspostApiClient::Client.new(ENV["API_KEY"])
    puts client.postage.parcel.international.calculate("NZ", 1.0, "INTL_SERVICE_EPI").service
  end
end
