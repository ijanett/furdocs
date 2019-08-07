class VetsController < ApplicationController
    
    def new
        @vet = Vet.new
    end

    def create
    end
end
