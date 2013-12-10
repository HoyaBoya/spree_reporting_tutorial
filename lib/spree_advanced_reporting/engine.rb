module Spree
  module AdvancedReporting
    class Engine < Rails::Engine
      require 'spree/core'
      isolate_namespace Spree
      engine_name "spree_advanced_reporting"

      config.autoload_paths += %W(#{config.root}/lib)

      config.generators do |g|
        g.test_framework :rspec
      end

      initializer :assets do |config|
        # Add any asset pre-compile here i.e.
        # Rails.application.config.assets.precompile += %w( some/css/file.css )
      end

      def self.activate
        [
          "../../app/models/spree/**/*.rb",
          "../../app/controllers/spree/**/*.rb",
          "../../config/routes.rb"
        ].each do |directory|
          Dir.glob(File.join(File.dirname(__FILE__), directory)).each do |c|
            Rails.env.production? ? require(c) : load(c)
          end
        end
      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end
