class Account < ActiveRecord::Base

  include BCrypt

  def password=(pwd)
    self.password_digest = BCrypt::Password.create(pwd)
  end

  #password getter.
  def password
    BCrypt::Password.new(self.password_digest)
  end


  #is the user logged in????
  #authorize/authenticate function included in model
  #the model can talk to the database!! anything you gotta do to access the database goes here.
    def self.authenticate(user_name,password)
      current_user = Account.find_by(user_name: user_name)

      if (current_user.password == password)
        return current_user
      else
        return nil
      end
    end


end
