require_relative 'the_watcher'
require_relative 'light_speed'
require_relative '../config/seakrets'

if TheWatcher.new(URL).watch!
  LightSpeed.blaze!
end
