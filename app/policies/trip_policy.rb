# frozen_string_literal: true

class TripPolicy < ApplicationPolicy
  def new?
    (user.role & dispatch_types).present?
  end

  def edit?
    (user.role & dispatch_types).present? || record.user_id == user.id
  end

  def permitted_attributes
    if (user.role & dispatch_types).present?
      %i[id status provider provider_status trip_number
         reason_code first_name last_name
         phone_number pickup_address pickup_city pickup_zip
         delivery_address delivery_city appointment_date
         appointment_time vehicle_type trip_type
         additional_passengers additional_appointments mileage
         cost scheduled_pickup actual_pickup_time
         departure_time actual_dropoff_time user_id
         vehicle_id signature_type instructions]
    elsif (user.role & driver_types).present?
      %i[actual_pickup_time departure_time actual_dropoff_time]
    end
  end
end
