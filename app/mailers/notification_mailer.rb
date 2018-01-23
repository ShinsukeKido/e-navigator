class NotificationMailer < ApplicationMailer
    default from: "downmap555@gmail.com"

  def send_confirm_to_user(user, interviewer, interview)
    @user = user
    @interviewer = interviewer
    @interview = interview
    mail subject: "面接日時が確定しました。",
         to: @user.email
  end

  def send_confirm_to_interviewer(user)
    @user = user
    mail subject: "面接希望日が決まりました。",
         to: @user.email
  end
end
