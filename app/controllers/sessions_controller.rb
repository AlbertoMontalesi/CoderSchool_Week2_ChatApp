class SessionsController < ApplicationController

    def new
    end

    def create
        if @user = User.find_by_email(params[:email]) #check :email
            if @user.authenticate(params[:password]) #check pw
                session[:user_id] = @user.id 
                flash[:success] = "Log in successfull"
                redirect_to incoming_messages_path 
            else
                flash.now[:error] = 'Password not correct'
                render 'new'
            end 
        else
            flash.now[:error] = 'User not found.'
            render 'new'
        end 
    end


    def destroy #for the logout
        session[:user_id] = nil 
        flash[:success] = "Log out successfull"
        redirect_to root_path
    end
end
