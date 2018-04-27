class RsvpMailer < ApplicationMailer
    default from: 'ckdevmnt@gmail.com'

    def rsvp_email
        @sender = params[:sender]
        @rsvp = params[:rsvp]
        suffix = ''
        @rsvp[:key].nil? ? suffix = "/events/#{@rsvp[:event_id]}/rsvps/#{@rsvp[:id]}" : suffix = "/rsvps/?key=".concat(URI.escape(@rsvp[:key], Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")))
        @url_yes = 'http://localhost:3000'.concat(suffix).concat('&attending=yes')
        @url_no = 'http://localhost:3000'.concat(suffix).concat('&attending=no')
        subject = "Invitation to #{@rsvp.event.title} from #{@sender}"
        mail(to: @rsvp[:email], subject: subject)
    end
end
