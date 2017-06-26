module Sidekiq
  module AzSidekiq
    # Method to access /views files
    module ViewHelper
      def self.local_view(view)
        view_path = File.join(File.expand_path('..', __FILE__), 'views')
        File.read(File.join(view_path, view))
      end
    end
  end
end
