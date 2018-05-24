module AuspostApiClient
    module Models
        class PostageResult
            attr_accessor :service, :total_cost, :costs
            def self.from_hash(hash)
                new_hash = hash[:postage_result]
                @service = new_hash[:service]
                @total_cost = new_hash[:total_cost]
                @costs = new_hash[:costs]

            end
        end
    end
end