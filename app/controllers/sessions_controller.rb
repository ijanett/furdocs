class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def create
        if auth_hash
            
            # grab first name
            # auth_hash[:info][:name].split(" ").first
            # grab last name
            # auth_hash[:info][:name].split(" ").last
            # grabs email
            # auth_hash[:info][:email]
            # grabs uid
            # auth_hash[:uid]
            # grabs provider
            # auth_hash[:provider]
        else
            @vet = Vet.find_by(email: params[:session][:email])
            if @vet.authenticate(params[:session][:password])
                log_in(@vet)
                redirect_to vets_url
            else
                flash[:notice] = "Invalid email or password. Please try again."
                render :new
            end
        end
    end

    def destroy
        if current_vet || current_owner
            session.clear
            redirect_to login_url
        else
            redirect_to root_url
        end
    end

    private

    def auth_hash
        request.env["omniauth.auth"]
    end
end