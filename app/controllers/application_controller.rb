class ApplicationController < ActionController::Base
    helper_method :current_user
    include ApplicationHelper

    def welcome
        if !logged_in?
            # @user = User.find(params[:id])
            # render 'users/show', locals: { user: @user }
            redirect_to login_path
        end
    end

end
