class UserMailer < ApplicationMailer
    def notify_user(user)
        @user = user 
        mail(to: @user.email, subject: "Welcome, #{@user.name}")
    end

    def password_reset_email(user)
        @user = user
        @reset_token = @user.password_reset_token
    
        # Construct the reset password URL
        reset_url = "https://ireporter-vndn.onrender.com/password_resets/#{@reset_token}/edit"
    
        mail(to: @user.email, subject: 'Password Reset') do |format|
          format.html { render plain: " Hi #{@user.name}, You can reset your password here: #{reset_url}. If you didn't initiate this process kindly ignore this email!" }
        end
      end
end
