class ApplicationController < ActionController::Base

    def login_required
        redirect_to root_url unless session.include? :user_id
    end

    def log_in(user)
        session[:user_id] = user.id
    end

    def current_vet
        Vet.find_by(id: session[:user_id])
    end

    def current_owner
        Owner.find_by(id: session[:user_id])
    end

end
