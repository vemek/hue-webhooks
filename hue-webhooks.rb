require 'sinatra/base'
require 'hue'

Dir.glob('./app/{models,controllers}/*.rb') {|file| require file }

# initialise constants
CLIENT = Hue::Client.new
LIGHT = CLIENT.lights[1]

# initialise light states
#LIGHT.on!
#at_exit { LIGHT.off! }
