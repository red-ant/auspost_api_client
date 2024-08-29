module AuspostApiClient
  module Models
    class PostageResult
      attr_accessor :service, :delivery_time, :total_cost, :costs

      def self.from_hash(hash)
        res = PostageResult.new
        new_hash = hash[:postage_result]

        res.service = new_hash[:service]
        res.delivery_time = new_hash[:delivery_time]
        res.total_cost = new_hash[:total_cost]
        res.costs = new_hash[:costs]

        res
      end
    end
  end
end
