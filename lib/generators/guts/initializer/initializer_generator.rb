module Guts
  # Initalizer generator
  class InitializerGenerator < Rails::Generators::Base
    # Creates Guts initializer file in Rails app
    def create_initializer_file
      create_file 'config/initializers/guts.rb' do
        %Q{
Guts.configure do
end
        }
      end
    end
  end
end