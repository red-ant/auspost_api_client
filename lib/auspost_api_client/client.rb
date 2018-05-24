require "net/http"
require "json"

require "auspost_api_client/postage"

module AuspostApiClient
    class Client
        attr_reader :headers
        attr_accessor :postage

        def initialize(api_key)
            @headers = {
                'auth-key' => api_key
            }

            @postage = Postage.new(self)
        end

        def http
            h = Net::HTTP.new(BASE_URL, 443)
            h.use_ssl = true
            h
        end
    end
end