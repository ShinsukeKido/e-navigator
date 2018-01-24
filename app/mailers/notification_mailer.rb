class NotificationMailer < ApplicationMailer
    default from: "downmap555@gmail.com"

  def send_confirm_to_user(interviewer, interviewee, interview)
    @interviewer = interviewer
    @interviewee = interviewee
    @interview = interview
    mail subject: "面接日時が確定しました。",
         to: [@interviewee.email, @interviewer.email]
  end

  def send_confirm_to_interviewer(interviewer, interviewee)
    @interviewer = interviewer
    @interviewee = interviewee
    mail subject: "面接希望日が決まりました。",
         to: [@interviewer.email, @interviewee.email]
  end
end
