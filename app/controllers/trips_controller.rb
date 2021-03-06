# frozen_string_literal: true

# Controller handles all Trip actions
class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update]
  before_action :filter_blank_time_fields, only: %i[create update]

  def index
    @date = trip_search_params[:date]
    @driver_id = trip_search_params[:driver_id]

    query = Trip.order(:scheduled_pickup_time).assigned_to(current_user)
    query = query.with_driver(@driver_id) if @driver_id.present?
    query = query.scheduled_on(@date.to_date) if @date.present?

    @trips = query

    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def enter_time
    @trips = Trip.order(:scheduled_pickup_time).assigned_to(current_user)
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(permitted_attributes(Trip))

    if @trip.save
      redirect_to @trip, notice: 'Trip saved successfully'
    else
      render :new
    end
  end

  def show; end

  def edit
    authorize @trip
  end

  def update
    respond_to do |format|
      if trip_params.key?(:signature)

        data_uri = trip_params[:signature]
        encoded_image = data_uri.split(',')[1]
        decoded_image = Base64.decode64(encoded_image)
        filename = 'signature.png'
        tmp_file = Tempfile.new(filename)
        tmp_file.binmode
        tmp_file.write(decoded_image)
        tmp_file.rewind

        @trip.signature.attach(io: tmp_file, filename: filename)

        tmp_file.unlink

        @trip.update_status
        format.html { redirect_to :trips }
      end

      if !trip_params.key?(:signature) && @trip.update(trip_params)
        if current_user.role.include?('driver')
          format.html { redirect_to :edit_trip }
        else
          format.js
          format.html { redirect_to @trip }
        end
      else
        format.html { render :edit }
      end
    end
  end

  private

  def trip_params
    params.require(:trip).permit(policy(@trip).permitted_attributes)
  end

  def trip_search_params
    params.permit(:date, :driver_id)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def filter_blank_time_fields
    time_fields = %w[scheduled_pickup_time actual_pickup_time departure_time actual_dropoff_time]
    time_inputs = %w[(1i) (2i) (3i) (4i) (5i)]

    time_fields.each do |field|
      next if params[:trip]["#{field}(4i)"].nil?
      next unless params[:trip]["#{field}(4i)"].blank?

      time_inputs.each do |input|
        params[:trip]["#{field}#{input}"] = ''
      end
    end
  end
end
