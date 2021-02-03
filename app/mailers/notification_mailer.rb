class NotificationMailer < ApplicationMailer

  def complete_mail(user)
    @user = user
    @url = "http://localhost:3000/users/#{@user.id}"
    mail(subject: "登録完了" ,to: @user.email)
  end
end