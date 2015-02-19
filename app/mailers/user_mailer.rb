class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  default from: 'contact.rockmypet@gmail.com'

  def welcome(user)
    @user = user
    @greeting = "Hi"

    mail(to: @user.email, subject: 'Welcome to Rock My Pet!')
  end
end
