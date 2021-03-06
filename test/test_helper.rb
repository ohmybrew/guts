# Start SimpleCov
require 'simplecov'

SimpleCov.start 'rails' do
  add_group 'Concerns', '/app/concerns'
  add_group 'Generators', '/lib/generators'
  add_group 'Policies', '/app/policies'
  add_filter 'lib/guts/version.rb' # No need to test version file... doesnt work.
  add_filter 'lib/tasks/guts_tasks.rake' # Inconsistant coverage reports, not sure why
  add_filter 'lib/tasks/guts_users.rake' # Inconsistant coverage reports, not sure why
  add_filter 'lib/tasks/guts_db.rake' # Inconsistant coverage reports, not sure why
  add_filter 'lib/generators/guts/install/install_generator.rb' # Can't find any possible way to test this...
end

# Start Codecov
if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../test/dummy/config/environment.rb', __FILE__)
ActiveRecord::Migrator.migrations_paths << File.expand_path('../../test/dummy/db/migrate', __FILE__)
ActiveRecord::Migrator.migrations_paths << File.expand_path('../../db/migrate', __FILE__)
require 'rails/test_help'

# For mocking web requests
require 'webmock/minitest'

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# For rake tests
require 'rake'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path('../fixtures', __FILE__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.fixtures :all
end
