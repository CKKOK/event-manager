class RsvpMailer < ApplicationMailer
    default from: 'ckdevmnt@gmail.com'

    def rsvp_email
        @sender = params[:sender]
        @rsvp = params[:rsvp]
        suffix = ''
        @rsvp[:key].nil? ? suffix = '/events/'.concat(@rsvp[:event_id].to_s).concat('/rsvps/').concat(@rsvp[:id].to_s) : suffix = '/rsvps/?key='.concat(URI.escape(@rsvp[:key], Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")))
        @url_yes = 'http://localhost.com:3000'.concat(suffix).concat('&attending=yes')
        @url_no = 'http://localhost.com:3000'.concat(suffix).concat('&attending=no')
        subject = 'Invitation to %s from %s' % [@rsvp.event.title, @sender]
        mail(to: @rsvp[:email], subject: subject)
    end
end
