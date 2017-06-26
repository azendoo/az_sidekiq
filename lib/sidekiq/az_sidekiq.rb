require 'sidekiq/az_sidekiq/version'
require 'sidekiq/az_sidekiq/search_extension'
require 'sidekiq/az_sidekiq/filter'
require 'sidekiq/az_sidekiq/view_helper'

begin
  require 'sidekiq/web'
rescue LoadError
  # client-only usage
end

if defined?(Sidekiq::Web)
  Sidekiq::Web.register Sidekiq::AzSidekiq::SearchExtension
  Sidekiq::Web.tabs['Search'] = 'search'
end
