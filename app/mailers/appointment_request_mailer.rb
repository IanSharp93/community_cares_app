class AppointmentRequestMailer < ApplicationMailer
    default from: 'georgiana.soule@gmail.com'
    
    def appointment_request_confirmation_email(appointment_request)
        @appointment_request = appointment_request
        #@url = 'https://community-cares-iansharp93.c9.io/appointment_request'
        mail(to: @appointment_request.email, subject: 'Welcome to Community Cares!')
    end
end
