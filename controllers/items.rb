class ItemsController < ApplicationController

  get '/' do
    @items = Item.all
    erb :home
  end

  get '/login' do
    erb :login
  end

  get '/registration' do
    erb :registration
  end

  post '/create' do
    @item = Item.new
    @item.name = params[:name]
    @item.quantity = params[:quantity]
    @item.save

    @items = Item.all

    erb :home
  end

  get '/update/:id' do
    @item = Item.find(params[:id])
    erb :update
  end

  post '/update' do
    @item = Item.find(params[:id])
    @item.name = params[:name]
    @item.quantity = params[:quantity]
    @item.save
    @items = Item.all
    erb :home
  end

  get '/destroy/:id' do
    @item = Item.find(params[:id])
    @item.destroy
    @items = Item.all
    erb :home
  end

  post '/destroy' do
    @items = Item.all
    erb :home
  end


end
