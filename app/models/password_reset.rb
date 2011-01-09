class PasswordReset < ActionMailer::Base
  def password_reset user
    recipients  user.email
    subject     "Password reset"
    from        "discussions.lu.lv"
    sent_on     Date.today
    body        :user => user
  end
end
