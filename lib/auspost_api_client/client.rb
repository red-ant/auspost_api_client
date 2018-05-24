require "net/http"
require "json"
require "auspost_api_client/models/country"

module AuspostApiClient
    class Client
        def initialize(api_key)
            @headers = {
                'auth-key' => api_key
            }
        end

        def countries
            response = http.request_get("#{API_URL}/country.json", @headers)
            AuspostApiClient::Models::Countries.from_hash JSON.parse(response.body, symbolize_names: true)
        end

        def http
            h = Net::HTTP.new(BASE_URL, 443)
            h.use_ssl = true
            h
        end
    end
end