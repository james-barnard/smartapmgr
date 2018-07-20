class SmartapsController < ApplicationController
  def dashboard
    owner = Owner.first
    @smartaps = owner.installed
  end
end
