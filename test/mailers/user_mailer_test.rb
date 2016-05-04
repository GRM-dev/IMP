require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "invite_user" do
    mail = UserMailer.invite_user(users(:one))
    assert_equal "Invitation to IMP", mail.subject
    assert_equal [users(:one).email], mail.to
    assert_equal ["grm.pl.group@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "restore_password" do
    mail = UserMailer.restore_password(users(:one))
    assert_equal "Reset password to IMP", mail.subject
    assert_equal [users(:one).email], mail.to
    assert_equal ["grm.pl.group@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
