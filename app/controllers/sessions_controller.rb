class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by({"email" => params["email"]})
     if @user 
            if BCrypt::Password.new(@user["password"]) == params["password"]
            session["user_id"]= @user["id"]
            flash["notice"] = "You logged in!"
            redirect_to "/companies"
            else
            flash["notice"] = "Wrong email/password"
            redirect_to "/sessions/new"
            end
     else
        redirect_to "/sessions/new"
     end
    end

    def destroy
        session["user_id"] = nil
        redirect_to "/sessions/new"
    end
end
