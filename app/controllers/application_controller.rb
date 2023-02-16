class ApplicationController < ActionController::Base
    helper_method :current_user
    include ApplicationHelper

    def welcome
        if !logged_in?
            redirect_to login_path
        end
    end

end
