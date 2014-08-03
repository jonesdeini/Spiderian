require 'net/http'

class TheWatcher

  attr_reader :uri, :inital_state, :current_state

  def initialize(url)
    @uri = URI(url)
    @current_state = @inital_state = fetch_page
  end

  def watch!
    while current_state == inital_state
      @current_state = fetch_page
      sleep 1
    end
    true
  end

  def fetch_page
    begin
      Net::HTTP.get(uri)
    rescue Errno::ECONNREFUSED
      puts 'connection refused'
    end
  end
end
