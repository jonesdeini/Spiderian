require "minitest/autorun"
require_relative '../lib/the_watcher'

require 'rack'

describe TheWatcher do

  it "returns true when the page changes" do
    require 'rack'
    app = Proc.new do |env|
          ['200', {'Content-Type' => 'text/html'}, ['bro']]
    end
    app2 = Proc.new do |env|
          ['200', {'Content-Type' => 'text/html'}, ['dawg']]
    end
    Thread.new {
      Rack::Handler::WEBrick.run app
      sleep 2
      Rack::Handler::WEBrick.shutdown
      Rack::Handler::WEBrick.run app2
    }
    proc {
      TheWatcher.new("http://localhost:8080").watch!
    }.must_output true
  end

end
