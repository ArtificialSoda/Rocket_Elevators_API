class ApplicationController < ActionController::Base
    def access_denied(exception)
        redirect_to index_path, alert: exception.message
    end
end
