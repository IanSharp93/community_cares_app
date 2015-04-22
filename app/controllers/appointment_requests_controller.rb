class AppointmentRequestsController < Application Controller
    def new
        @appointment_request = Appointment_request.new
    end
    def create
        @appointment_request = Contact.new(params[:appointment_request])
        @appointment_request.request = request
        if @appointment_request.deliver
            flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
        else
            flash.now[:error] = 'Cannot send message.'
            render :new
        end
    end
end