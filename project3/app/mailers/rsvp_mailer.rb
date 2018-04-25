class RsvpMailer < ApplicationMailer
    default from: 'ckdevmnt@gmail.com'

    def rsvp_email
        @user = params[:user]
        @url = 'http://localhost.com:3000'
        mail(to: @user.email, subject: 'RSVP Nao kthxbai')
    end
end
