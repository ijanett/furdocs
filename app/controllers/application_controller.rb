class ApplicationController < ActionController::Base
    helper_method :current_owner, :is_vet

    def login_required
        redirect_to root_url unless session.include? :user_id
    end

    def log_in(user)
        session[:user_id] = user.id
    end

    def is_vet
        vet = Vet.find_by(id: session[:user_id])
        if vet.nil?
            current_owner
        end
    end

    def current_owner
        Owner.find_by(id: session[:user_id])
    end

end
