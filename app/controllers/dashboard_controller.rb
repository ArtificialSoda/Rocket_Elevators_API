class DashboardController < InheritedResources::Base
    def dashboard
        p params[:controller]
    end
end