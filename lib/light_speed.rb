require "capybara"
require "capybara/poltergeist"
require "capybara/dsl"

require_relative 'seakrets'

Capybara.javascript_driver = :poltergeist
Capybara.run_server = false

module RatMan

  include Capybara::DSL

  def self.blaze!(session=nil)
    session ||= Capybara::Session.new(:poltergeist)

    session.visit(URL)
    session.click_link("paypal")
    session.fill_in("email", :with => LOGIN)
    session.fill_in("password", :with => PASSWORD)
    session.click_button("LOG IN")
    wait_for_javascript
    session.save_screenshot('login.png')
    return session
  end

  def self.wait_for_javascript
    sleep 2
  end
  private_class_method :wait_for_javascript

end
