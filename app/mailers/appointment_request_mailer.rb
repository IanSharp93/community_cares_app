class AppointmentRequestMailer < ApplicationMailer
    default from: 'community.cares.boulder@gmail.com'
    
    def appointment_request_confirmation_email(appointment_request)
        @appointment_request = appointment_request
        #@url = 'https://community-cares-iansharp93.c9.io/appointment_request'
        mail(to: [@appointment_request.email, 'community.cares.boulder@gmail.com'], subject: 'Welcome to Community Cares!')
    end
    
    def appointment_request_internal_email(appointment_request)
        @appointment_request = appointment_request 
        mail(to: 'community.cares.boulder@gmail.com', subject: 'Client Appointment Request')
    end
end
