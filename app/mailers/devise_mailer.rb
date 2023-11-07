class DeviseMailer < Devise::Mailer
  def notify_user(user)
    @user = user
    mail(to: @user.email, subject: "Welcome, #{@user.name}")
  end

  def password_reset_email(user)
    @user = user
    @reset_token = @user.password_reset_token

    
    reset_url = edit_password_reset_url(@reset_token)

    mail(to: @user.email, subject: 'Password Reset') do |format|
      format.text { render plain: "Hi #{@user.name}, You can reset your password here: #{reset_url}. If you didn't initiate this process, kindly ignore this email!" }
    end
  end
end
  