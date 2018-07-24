class SmartapsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def dashboard
    owner = Owner.first
    installed = owner.installed
    taps = installed.map do |m|
      m.loads.map do |t|
        {
          serial_number: t.machine.serial_number,
          location: t.machine.last_location_name,
          tap: t.meter_number,
          product: t.product.name,
          avg_daily: t.avg_daily,
          avg_size: t.avg_size,
          ounces_remaining: t.ounces_remaining,
          days_remaining: t.days_remaining,
          last_loaded: t.loaded_at
        }
      end
    end.flatten

    @smartaps = taps.sort! { |a,b| a[sort_column.to_sym] <=> b[sort_column.to_sym] }
    @smartaps = @smartaps.reverse! if sort_direction == 'desc'
  end

  private

  def sort_column
    %w[location product avg_daily avg_size last_loaded].include?(params[:sort]) ? params[:sort] : 'days_remaining'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
