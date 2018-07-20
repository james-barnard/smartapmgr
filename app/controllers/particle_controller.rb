require 'httparty'

class ParticleController < ApplicationController
  include HTTParty
  protect_from_forgery except: :pour

  def pour
    machine = Machine.find_by_device_id params["coreid"]
    unless machine.nil?
      pours = params["data"].split "|"
      pours.each do |p|
        meter, count = p.split ":"
        count  = count.to_i
        unless meter.nil? || count < 1
          puts "poured from valve: #{meter} on machine: #{machine.serial_number} tick count: #{count}"
          machine.record_tick(meter, count)
        end
      end
    end

    head :ok, content_type: "text/html"
  end
end
