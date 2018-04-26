class RsvpMailer < ApplicationMailer
    default from: 'ckdevmnt@gmail.com'

    def rsvp_email
        @sender = params[:sender]
        @rsvp = params[:rsvp]
        suffix = ''
        @rsvp[:key].nil? ? suffix = '/events/'.concat(@rsvp[:event_id].to_s).concat('/rsvps/').concat(@rsvp[:id].to_s) : suffix = '/rsvps/?key='.concat(@rsvp[:key])
        @url = 'http://localhost.com:3000'.concat(suffix)
        mail(to: @rsvp[:email], subject: 'RSVP Nao kthxbai')
    end
end
