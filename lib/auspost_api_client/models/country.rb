module AuspostApiClient
  module Models
    class Countries
      attr_reader :countries

      def self.from_hash(hash)
        hash.first[1].first[1].map { |country| Country.from_hash(country) }
      end

      class Country
        attr_accessor :code, :name, :description, :postal_service_name, :postal_service_url

        def self.from_hash(hash)
          country = Country.new

          country.code = hash[:code]
          country.name = hash[:name]
          country.description = hash[:description]
          country.postal_service_name = hash[:postalServiceName]
          country.postal_service_url = hash[:postalServiceUrl]

          country
        end
      end
    end
  end
end
