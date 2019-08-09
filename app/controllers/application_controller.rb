class ApplicationController < ActionController::Base
    helper_method :current_owner, :is_vet, :login_required

    def login_required
        # test = session.include? :user_id
        if !session.include? :user_id || session[:user_id].nil?
            redirect_to(root_url)
        end
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
