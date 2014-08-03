require 'net/http'

class TheWatcher

  attr_reader :uri, :inital_state, :current_state

  def initialize(url)
    @uri = URI(url)
    @current_state = @inital_state = fetch_page
  end

  def watch!
    while current_state == inital_state
      sleep 1
      fetch_page
    end
    true
  end

  def fetch_page
    Net::HTTP.get(uri)
  end
end
