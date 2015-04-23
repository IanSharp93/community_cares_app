class AppointmentRequest < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :comments
  
  validates_format_of(
    :email,
    with: /\A[\w.]+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}\Z/,
    message: 'Not a valid email'
  )
  
  
  
end
