class CreateAppointmentRequests < ActiveRecord::Migration
  def change
    create_table :appointment_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.text :comments
      t.string :sex
      t.string :type_of_appointment
      t.integer :urgency

      t.timestamps null: false
    end
  end
end
