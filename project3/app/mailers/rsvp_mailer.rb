require 'rqrcode'

class RsvpMailer < ApplicationMailer
    default from: 'ckdevmnt@gmail.com'

    def rsvp_email
        host = ENV["RAILSHOST"] || "http://localhost:3000"
        @sender = params[:sender]
        @rsvp = params[:rsvp]
        suffix = ''
        @rsvp[:key].nil? ? suffix = "/events/#{@rsvp[:event_id]}/rsvps/#{@rsvp[:id]}" : suffix = "/rsvps/?key=".concat(URI.escape(@rsvp[:key], Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")))
        @url_yes = host + suffix + '&attending=yes'
        @url_no = host + suffix + '&attending=no'
        subject = "Invitation to #{@rsvp.event.title} from #{@sender}"
        mail(to: @rsvp[:email], subject: subject)
    end

    def ticket_email(rsvp)
        host = ENV["RAILSHOST"] || "http://localhost:3000"
        @rsvp = rsvp
        @qr = RQRCode::QRCode.new( rsvp.key, :size => 8, :level => :h )
        subject = "Confirmation of RSVP to #{rsvp.event.title}"
        mail(to: rsvp[:email], subject: subject)
    end
end
