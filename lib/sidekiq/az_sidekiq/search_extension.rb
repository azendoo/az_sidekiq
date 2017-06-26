module Sidekiq
  module AzSidekiq
    # Extension search for web views
    module SearchExtension
      def self.registered(app)
        retrieve_search = lambda do
          @count = params[:count] || 25
          (@current_page, @total_size, @jobs) = Filter.search(
            params[:type], params[:page], @count, params[:search], reverse: true
          )
          render(:erb, ViewHelper.local_view('search.erb'))
        end

        app.get '/search', &retrieve_search
        app.post '/search', &retrieve_search
      end
    end
  end
end
