module Guts
  # This concern allows for a model to be "navigatable"
  # in the admin panel for use with developing menu links
  module NavigatableConcern
    extend ActiveSupport::Concern

    included do
      # Renders a string based on options from the model
      # @note This method uses instance_eval to get the instance variables..
      #   :title to self.title, :type.title to self.type.title
      # @return [String] compiled string based on format and variables
      # @see Guts::NavigatableConcern::ClassMethods#navigatable
      def navigatable_format
        formatted = self.class.navigatable_opts[:format]
        self.class.navigatable_opts[:variables].each do |var|
          formatted = formatted.gsub(/\:#{var}/, instance_eval("self.#{var}"))
        end
        
        formatted
      end
    end
    
    # Class methods for the concern
    # @attr [Hash] navigatable_opts the options
    module ClassMethods
      # @return [Hash] the configuration for the navigatable object
      attr_accessor :navigatable_opts

      # Allows a class to be navigatable
      # @param [Array] variables the variables to access from the model
      # @param [Hash] opts the options for the concern
      # @option opts [String] :format the text format to use with variables
      # @example Example for Content model
      #   # This will convert the format into something like: "[Page] Test"
      #   navigatable :"type.title", :title, format: "[:type.title] :title"
      def navigatable(*variables, **opts)
        @navigatable_opts = {
          variables: variables,
          format: opts[:format]
        }
      end
    end
  end
end
