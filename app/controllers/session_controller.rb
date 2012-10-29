# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#

class SessionController < ApplicationController

  # get /sign_in
  def new
  end

  def create
    user = User.find_by( name: params[:username] )
    if user.authenticate( params[:password] )
      session[:user_id] = user.to_param
      _target = session[:requested_path].present? ? session[:requested_path] : root_path
      session[:requested_path] = nil
      redirect_to _target, notice: t(:successfully_logged_in_as, username: user.name)
    else
      flash[:alert] = t('invalid_login')
      render :new
    end
  rescue
    flash[:alert] = t('invalid_login')
    render :new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: t('you_are_signed_out')
  end

end