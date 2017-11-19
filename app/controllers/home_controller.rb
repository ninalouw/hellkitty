class HomeController < ApplicationController

    def about_ian
        @title = "Ian Boothby"
        render :about_ian
    end

    def about_pia
        @title = "Pia Guerra"
        render :about_pia
    end

    def contact
        render :contact
    end

    def store
        render :store
    end

    def signin
        render :sign_in
    end
end
