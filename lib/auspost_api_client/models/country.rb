module AuspostApiClient
    module Models
        class Countries
            attr_reader :countries

            def self.from_hash(hash)
                countries = []
                # Why is the api like this...
                hash.first[1].first[1].each do |country|
                    countries << Country.from_hash(country)
                end
                return countries
            end

            class Country
                attr_reader :code, :name, :description, :postal_service_name, :postal_service_url

                def self.from_hash(hash)
                    @code = hash['code']
                    @name = hash['name']
                    @description = hash['description']
                    @postal_service_name = hash['postalServiceName']
                    @postal_service_url = hash['postalServiceUrl']
                end

            end
        end

    end
end