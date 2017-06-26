module Sidekiq
  module AzSidekiq
    # Filter the page instance method of Sidekiq::Paginator
    module Filter
      extend Sidekiq::Paginator

      def self.search(key, pageidx = 1, page_size = 25, query = nil, opts = nil)
        (current_page, total_size, jobs) = page(key, pageidx, page_size, opts)
        jobs = jobs.map do |msg, score|
          Sidekiq::SortedEntry.new(nil, score, msg)
        end
        unless query.nil?
          jobs = jobs.select do |job|
            job.item.to_json.downcase.include?(query.downcase)
          end
        end
        [current_page, total_size, jobs]
      end
    end
  end
end
