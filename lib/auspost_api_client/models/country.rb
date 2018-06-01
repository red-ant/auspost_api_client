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
                countries
            end

            class Country
                attr_accessor :code, :name, :description, :postal_service_name, :postal_service_url

                def self.from_hash(hash)
                    ret = Country.new
                    ret.code = hash[:code]
                    ret.name = hash[:name]
                    ret.description = hash[:description]
                    ret.postal_service_name = hash[:postalServiceName]
                    ret.postal_service_url = hash[:postalServiceUrl]
                    ret
                end

            end
        end

    end
end