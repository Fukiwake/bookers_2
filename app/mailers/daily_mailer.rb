class DailyMailer < ApplicationMailer
  def daily_mail
    @users_email = User.pluck(:email)
    mail(subject: "おはようございます", to: @users_email)
  end
end
