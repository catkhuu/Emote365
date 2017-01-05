class CallbacksController < Devise::OmniauthCallbacksController
    def twitter
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in @user
        session["warden.user.user.key"][0] = [@user.id]
        if @user.email == ''
          render :'welcome/update_email'
        else
          @calendar = @user.calendars[0]
          redirect_to calendar_path(@calendar)
        end
    end
end
