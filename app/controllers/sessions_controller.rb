class SessionsController < ApplicationController
    def new

    end

    def create
        auth_hash = request.env['omniauth.auth']

        if session[:user_id]
            # User is already logged in
            user = User.find(session[:user_id])
        else
             # Check if the user exists esbalish the session, else create the user and session
             auth = Authorization.find_or_create(auth_hash)

             if !auth.nil?
                session[:user_id] = auth.user.id
             end


        end

        redirect_to posts_path
        # raise request.env['omniauth.auth'].to_yaml
     end

    def destroy
        session[:user_id] = nil
        # TODO:Redirect to session new with notice
        render :text => "Logout successful!"
    end

    def failure
         render :text => "You did not allow access to Goalchi."
        # raise request.env['omniauth.auth'].to_yaml
    end
end
