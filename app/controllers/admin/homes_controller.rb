class Admin::HomesController < ApplicationController
  def top
    @admin = admin.all
  end
end
