$: << File.dirname(__FILE__)+'/../lib'
Dir.mkdir('report') unless File.directory?('report')

require 'rspec/core'
require 'rspec/expectations'
require 'active_support/inflector'
require "rack/test"
require 'cucumber-api'


World(Rack::Test::Methods)


Before do

end

After do
end
