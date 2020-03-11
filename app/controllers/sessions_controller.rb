class SessionsController < ApplicationController
  def new
  end

  def create
    # 1. find user by email address and downcase it
    user = User.find_by( email: params[:email].downcase )

    # 2. Check if the user can be authenticated using the password provided
    if user && user.authenticate(params[:password])
      cookies.signed[:user_id] = user.user_id
      flash[:notice] = "Sign in successful!"
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid email/password combination"
      render :new
    end  
    # 3. If a user is found and authenticated, then set signed cookie

    # 4. Otherwise, set alert message and render new form
  end

  def destroy
  end
end
