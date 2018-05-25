module AuspostApiClient
    module Models
        class PostageResult
            attr_accessor :service, :total_cost, :costs
            def self.from_hash(hash)
                ret = PostageResult.new
                new_hash = hash[:postage_result]
                ret.service = new_hash[:service]
                ret.total_cost = new_hash[:total_cost]
                ret.costs = new_hash[:costs]
                ret
            end
        end
    end
end