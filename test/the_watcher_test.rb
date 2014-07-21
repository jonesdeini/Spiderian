require "minitest/autorun"
require_relative '../lib/the_watcher'
require 'webmock/minitest'

describe TheWatcher do

  it "returns true when the page changes" do
    stub_request(:get, "www.example.com").to_return({:body => "bro"}, {:body => "dawg"})
    TheWatcher.new("http://www.example.com").watch!.must_equal true
  end

end
