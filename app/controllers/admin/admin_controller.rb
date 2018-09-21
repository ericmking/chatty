class Admin::AdminController < ApplicationController
  before_action :is_admin?

  def is_admin?
    puts "checking if this guy is an admin"

    return true
  end
end