# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/invite_user
  def invite_user
    UserMailer.invite_user
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/restore_password
  def restore_password
    UserMailer.restore_password
  end

end
