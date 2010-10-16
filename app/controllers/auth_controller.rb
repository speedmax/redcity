class AuthController < ApplicationController
  def new
    if current_user?
      flash[:notice] = 'You are already signed in. Please sign out if you want to sign in as a different user.'
      redirect_to(root_path)
    end
  end

  def callback    
    account = case request.env['rack.auth']['provider']
      when 'twitter' then
        Omnisocial::TwitterAccount.find_or_create_from_auth_hash(request.env['rack.auth'])
      when 'facebook' then
        Omnisocial::FacebookAccount.find_or_create_from_auth_hash(request.env['rack.auth'])
    end
  
    self.current_user = account
    
    if !current_user.setup?
      flash[:notice] = t(:setup_account)
      redirect_to edit_profile_path(current_user)
    else
      redirect_back_or_default(root_path)
    end
  end

  def failure
    render :action => 'new'
  end

  def destroy
    logout!
    redirect_to(root_path)
  end
end
