require "auspost_api_client/models/country"
require "auspost_api_client/models/postage_result"

module AuspostApiClient
    class Postage
        attr_accessor :parcel

        def initialize(client)
            @client = client
            @parcel = Parcel.new(client)
        end

        def countries
            response = @client.http.request_get("#{API_URL}/postage/country.json", @client.headers)
            AuspostApiClient::Models::Countries.from_hash JSON.parse(response.body, symbolize_names: true)
        end

        class Parcel
            attr_accessor :international

            def initialize(client)
                @client = client
                @international = International.new(client)
            end
            class International
                def initialize(client)
                    @client = client
                end

                def calculate(country_code, weight, service_code, option_code=nil, suboption_code=nil, extra_cover=nil)
                    query = "&country_code=#{country_code}&weight=#{weight}&service_code=#{service_code}"
                    query += "&option_code=#{option_code}" if option_code
                    query += "&suboption_code=#{suboption_code}" if suboption_code
                    query += "&extra_cover=#{extra_cover}" if extra_cover

                    response = @client.http.request_get("#{API_URL}/postage/parcel/international/calculate.json?#{query}",
                                                        @client.headers)
                    AuspostApiClient::Models::PostageResult.from_hash JSON.parse(response.body, symbolize_names: true)
                end

                def self.service()


                end
            end
        end
    end
end