require 'sinatra/base'

require './controllers/application'
require './controllers/items'

require './models/items'

map ('/') { run ItemsController } 
