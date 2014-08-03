require "capybara"
require "capybara/poltergeist"
require "capybara/dsl"

Capybara.run_server = false

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {js_errors: false, phantomjs_options: ['--load-images=no']})
end

module LightSpeed

  include Capybara::DSL

  def self.blaze!(session=nil)
    session ||= Capybara::Session.new(:poltergeist)

    session.visit(URL)
    session.first("form").click
    wait_for_javascript
    session.fill_in("login_email", :with => LOGIN)
    session.fill_in("login_password", :with => PASSWORD)
    session.find("submitLogin").click
    session.save_screenshot('login.png')
    session.find("continue_abovefold").click
    session.save_screenshot('pay.png')
    return session
  end

  def self.wait_for_javascript
    sleep 2
  end
  private_class_method :wait_for_javascript

end
