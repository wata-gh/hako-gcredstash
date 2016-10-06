require 'hako/env_provider'

module Hako
  module EnvProviders
    class Gcredstash < EnvProvider
      # @param [Pathname] root_path
      # @param [Hash<String, Object>] options
      def initialize(root_path, options)
        unless options['app']
          validation_error!('app must be set')
        end
        @app = options['app']
        @env = options['env']
      end

      # @param [Array<String>] variables
      # @return [Hash<String, String>]
      def ask(variables)
        env = {}
        read_from_gcredstash do |key, val|
          if variables.include?(key)
            env[key] = val
          end
        end
        env
      end

      private

      # @yieldparam [String] key
      # @yieldparam [String] val
      # @return [nil]
      def read_from_gcredstash(&block)
        base_key = @env.nil? ? @app : "#{@app}.#{@env}."
        cred_value = `gcredstash list | grep #{base_key} | awk '{print $1}'`.strip
        cred_value.each_line.each do |key|
          val = `gcredstash get #{key}`
          block.call(key, val)
        end
      end
    end
  end
end
