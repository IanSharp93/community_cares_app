class AppointmentRequestsController < ApplicationController
  def new
    @appointment_request = AppointmentRequest.new
  end
  def create
    @appointment_request = AppointmentRequest.new(appointment_request_params)
    # binding.pry
    result = AppointmentRequestMailer.appointment_request_confirmation_email(@appointment_request).deliver
    if result 
      redirect_to root_url, notice: 'Thanks, check your email'
    else 
      flash[:notice] = 'Cannot send message.'
      flash[:color]= "invalid"
    end
  end
    #need so
    
    #   if @appointment_request.deliver
    #      flash[:notice] = 'Thank you for your message. We will contact you soon!'
    #      flash[:color]= "valid"
    #   else
    #      flash[:notice] = 'Cannot send message.'
    #      flash[:color]= "invalid"
    #   end     
    #      render :new
  
  private
  
  def appointment_request_params
    params.require(:appointment_request).permit(:first_name, :last_name, :sex, :email, :phone, :comments, :type_of_appointment)
  end
end