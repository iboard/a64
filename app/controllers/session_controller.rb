# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#

class SessionController < ApplicationController

  # get /signin
  def new
  end

  # post /signin
  def create
    if valid_credentials?
      session[:user_id] = @user.to_param
      redirect_to after_login_path, notice: t(:successfully_logged_in_as, username: @user.name)
    else
      flash[:alert] = t('invalid_login')
      render :new
    end
  end

  # delete /signout
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: t('you_are_signed_out')
  end


private

  # @return [String] - the path to redirect to
  def after_login_path
    _target = session[:requested_path].present? ? session[:requested_path] : root_path
    session[:requested_path] = nil
    _target
  end


  # Sets @user
  # @return [Boolean] true if user found and authenticated
  def valid_credentials?
    begin
      @user = User.find_by(name: params[:username])
      @user.authenticate(params[:password])
    rescue => e
      Rails.logger.warn("INVALID LOGIN #{params.inspect} / #{e.inspect}")
      false
    end
  end

end