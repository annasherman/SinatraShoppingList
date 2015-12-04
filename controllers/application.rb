class ApplicationController < Sinatra::Base

  Bundler.require
  require 'bundler'

ActiveRecord::Base.establish_connection(
  :database => 'shopping_list',
  :adapter => 'postgresql'
)

set :views, File.expand_path('../../views',__FILE__)
set :public, File.expand_path('../../public',__FILE__)

enable :sessions

end
