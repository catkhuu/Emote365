class CallbacksController < Devise::OmniauthCallbacksController
    def twitter
        @user = User.from_omniauth(request.env["omniauth.auth"])
        # session[:user_id] = @user.id
        sign_in @user
        if @user.email == ''
          render :'welcome/update_email'
        else
          @calendar = @user.calendars[0]
          redirect_to calendar_path(@calendar)
        end
    end
end
