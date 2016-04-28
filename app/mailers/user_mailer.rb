class UserMailer < ApplicationMailer
  default from: "grm.pl.group@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invite_user.subject
  #
  def invite_user(user)
    @greeting = "Hi! You were invited nyga"

    mail to: user.email, subject: 'Invitation to IMP'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.restore_password.subject
  #
  def restore_password(user)
    @greeting = "Hi"

    mail to: user.email, subject: 'Reset password to IMP'
  end
end
