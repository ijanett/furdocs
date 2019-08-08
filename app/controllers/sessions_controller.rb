class SessionsController < ApplicationController
    before_action :login_required, only: :destroy

    def welcome
    end

    def new
    end

    def create
        if auth_hash
            owner = Owner.find_or_create_with_oauth(auth_hash)
            log_in(owner)
            redirect_to owner_url(owner)
        else
            vet = Vet.find_by(email: params[:session][:email])
            if vet.authenticate(params[:session][:password])
                log_in(vet)
                redirect_to vet_url(vet)
            else
                flash[:notice] = "Invalid email or password. Please try again."
                render :new
            end
        end
    end

    def destroy
        if is_vet || current_owner
            session.clear
            redirect_to root_url
        end
    end

    private

    def auth_hash
        request.env["omniauth.auth"]
    end
end