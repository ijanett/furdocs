class ApplicationController < ActionController::Base
    helper_method :current_owner, :is_vet

    def login_required
        redirect_to root_url unless session.include? :user_id
    end

    def log_in(user)
        if request.env["omniauth.auth"]
            session[:user_id] = user.uid
        else
            session[:user_id] = user.id
        end
    end

    def is_vet
        vet = Vet.find_by(id: session[:user_id])
    end

    def current_owner
        Owner.find_by(uid: session[:user_id])
    end

end
