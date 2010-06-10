module CachingMailer
  extend ActiveSupport::Concern

  included do
    delegate :cache, :cache_store, :perform_caching, :cache_configured?, :benchmark, :silence, :to => ActionController::Base
    include ActionController::Caching::Fragments
  end

  class Railtie < Rails::Railtie
    ActiveSupport.on_load(:action_mailer) do
      include CachingMailer
    end
  end

  protected
  
  def fragment_cache_key(key)
    ActiveSupport::Cache.expand_cache_key(key.is_a?(Hash) ? url_for(key).split("://").last : key, 'views/mailers')
  end

  def cache(key, options = {}, &block)
    if cache_configured?
      cache_store.fetch(ActiveSupport::Cache.expand_cache_key(key, :mailer), options, &block)
    else
      yield
    end
  end
end
