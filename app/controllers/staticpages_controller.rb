class StaticpagesController < ApplicationController
  before_action :authenticate_user!, except: [:about, :help]
  def about
  end
end
