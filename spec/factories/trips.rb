# frozen_string_literal: true

FactoryBot.define do
  factory :trip do
    trip_number { 'HAHA1997444A' }
    first_name { 'Jon' }
    last_name { 'Snow' }
    phone_number { '2087779989' }
    pickup_address { '9876 S CHERRY GROVE LN' }
    pickup_city { 'BOISE' }
    pickup_zip { '87654' }
    delivery_address { '125 N COOL ST' }
    delivery_city { 'MERIDIAN' }
    appointment_date { '20190125' }
    appointment_time { '900' }
    reason_code { '64' }
    provider_status { 'S1' }
    vehicle_type { 'C' }
    trip_type { 'T' }
    additional_passengers { 0 }
    additional_appointments { 0 }
    mileage { 3.54 }
    cost { 41.75 }
    special_needs { 'CALL TO CONFIRM W PICK UP TIME/CALL UPON ARRIVAL' }
    instructions { 'RTP T/W/R/F M-12:30PM          EXP 11/30/18' }
  end

  factory :second_trip, class: 'Trip' do
    trip_number { 'HAHA1997444B' }
    first_name { 'Jon' }
    last_name { 'Snow' }
    phone_number { '2087779989' }
    pickup_address { '125 N COOL ST' }
    pickup_city { 'MERIDIAN' }
    pickup_zip { '87654' }
    delivery_address { '9876 S CHERRY GROVE LN' }
    delivery_city { 'BOISE' }
    appointment_date { '20190125' }
    appointment_time { '900' }
    reason_code { '64' }
    provider_status { 'S1' }
    vehicle_type { 'C' }
    trip_type { 'T' }
    additional_passengers { 0 }
    additional_appointments { 0 }
    mileage { 3.54 }
    cost { 41.75 }
    special_needs { 'CALL TO CONFIRM W PICK UP TIME/CALL UPON ARRIVAL' }
    instructions { 'RTP T/W/R/F M-12:30PM          EXP 11/30/18' }
  end

  factory :third_trip, class: 'Trip' do
    trip_number { 'HAHA1997333A' }
    first_name { 'Trip' }
    last_name { 'Notassigned' }
    phone_number { '2087779989' }
    pickup_address { '987 NOT ASSIGNED ST' }
    pickup_city { 'BOISE' }
    pickup_zip { '87654' }
    delivery_address { '9876 S APPLE TREE ST' }
    delivery_city { 'BOISE' }
    appointment_date { '20190125' }
    appointment_time { '900' }
    reason_code { '64' }
    provider_status { 'S1' }
    vehicle_type { 'C' }
    trip_type { 'T' }
    additional_passengers { 0 }
    additional_appointments { 0 }
    mileage { 9.77 }
    cost { 68.43 }
  end
end
