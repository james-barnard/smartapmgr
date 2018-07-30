class SmartapsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def dashboard
    owner = Owner.first
    installed = owner.installed
    taps = installed.map do |m|
      m.current_loads.map do |load|
        {
          machine_id: m.id,
          serial_number: load.machine.serial_number,
          location: load.machine.last_location_name,
          meter_number: load.meter_number,
          product: load.product.name,
          avg_daily: load.avg_daily,
          avg_size: load.avg_size,
          ounces_remaining: load.ounces_remaining,
          days_remaining: load.days_remaining,
          last_loaded: load.loaded_at
        }
      end
    end.flatten || []

    unless @smartaps.nil?
      @smartaps = taps.sort! { |a,b| a[sort_column.to_sym] <=> b[sort_column.to_sym] }
      @smartaps = @smartaps.reverse! if sort_direction == 'desc'
    end
  end

  def edit
    @machine = Machine.find params[:machine_id]
    @meter_number = params[:meter_number].to_i
    @load = @machine.loads.build
  end

  private

  def sort_column
    %w[location product avg_daily avg_size last_loaded].include?(params[:sort]) ? params[:sort] : 'days_remaining'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
