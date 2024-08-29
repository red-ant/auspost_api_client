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
    assert_equal(
      client.postage.parcel.international.calculate("NZ", 1.0, "INTL_SERVICE_EPI").class,
      AuspostApiClient::Models::PostageResult
    )
  end

  def test_it_can_calculate_postage_parcel_domestic
    client = AuspostApiClient::Client.new(ENV["API_KEY"])
    assert_equal(
      client.postage.parcel.domestic.calculate("5000", "6000", "60", "10", "40", "5", "AUS_PARCEL_REGULAR").class,
      AuspostApiClient::Models::PostageResult
    )
  end
end
