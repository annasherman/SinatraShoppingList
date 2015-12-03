require 'sinatra/base'

require './controllers/application'
require './controllers/items'
require './controllers/users'

require './models/items'
require './models/accounts'

map ('/') { run ItemsController }
map ('/users') { run UsersController }
