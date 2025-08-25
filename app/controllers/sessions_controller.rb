class SessionsController < ApplicationController
  def new; end

  def create
    return redirect_to login_path unless session_params[:name] && !session_params[:name].empty?

    session[:name] = session_params[:name]
    redirect_to root_path
  end

  def destroy
    session.delete :name
    redirect_to login_path
  end

  private

  def session_params
    params.permit(:name)
  end
end
