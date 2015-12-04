class UsersController < ApplicationController

##check if the user exists helper function
  def does_user_exist(user_name)
      user = Account.find_by(:user_name => user_name)
      if user
        return true
      else
        return false
      end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = Account.authenticate(params[:user_name],params[:password])
    if user
      session[:current_user] = user
      redirect '/'
    # @message = "Thank you for logging in"
    else
      @message = 'Your username or password is incorrect.'
    end
  end

  get '/registration' do
    erb :registration
  end

  post '/registration' do
    #does the user already exist
    user = does_user_exist(params[:user_name])
    #if not create a new user
    if user
      @message = "The user already exists!"
      erb :login
    else #create new user
      user = Account.create(user_email: params[:user_email], user_name: params[:user_name], password: params[:password])

      session[:current_user] = user
      redirect '/'
    end
  end

  get '/logout' do
    session[:current_user] = nil
    redirect '/'
  end


end
