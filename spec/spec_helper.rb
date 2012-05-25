require 'rubygems'
require 'bundler/setup'

require 'rspec'
require 'redis-classy'

RSpec.configure do |config|
  # Use database 15 for testing so we don't accidentally step on you real data.
  Redis::Classy.db = Redis.new(:db => 15)
  unless Redis::Classy.keys.empty?
    puts '[ERROR]: Redis database 15 not empty! If you are sure, run "rake flushdb" beforehand.'
    exit!
  end
end
