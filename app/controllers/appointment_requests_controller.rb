class AppointmentRequestsController < ApplicationController
  def new
    @appointment_request = AppointmentRequest.new
  end
  def create
    @appointment_request = AppointmentRequest.new(appointment_request_params)
    # binding.pry
    
    if @appointment_request.valid?
      AppointmentRequestMailer.appointment_request_confirmation_email(@appointment_request).deliver
        
      AppointmentRequestMailer.appointment_request_internal_email(@appointment_request).deliver
        
      redirect_to root_url, :notice =>"Thank you for reaching out. We'll be in touch with you soon"
    else
      # re-render new form (this automatically displays errors)
      render action: 'new'
    end
      
    
    
    # begin
      
    # rescue Exception => e
    #   puts e.message
    # end
    
    # if result1 and result2 
    #   message = 'Thanks, check your email'
    # else 
    #   message = 'Email did not send'
    # end
    
    
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