class UserMailer < ApplicationMailer
  default from: "grm.pl.group@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invite_user.subject
  #
  def invite_user
    @greeting = "Hi! You were invited nyga"

    mail to: "rodzyndawid@gmail.com", subject: 'Invitation to IMP'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.restore_password.subject
  #
  def restore_password
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
