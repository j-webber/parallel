class GuestsController < ApplicationController
  def index
    @guests = Current.user.guests.all
  end

  def new
    @guest = Current.user.guests.new
  end

  def create
    @guest = Current.user.guests.new(guest_params)
    if @guest.save
      redirect_to dashboard_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def guest_params
    params.expect(guest: [ :first_name, :last_name, :nickname ])
  end
end
