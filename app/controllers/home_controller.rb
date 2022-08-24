class HomeController < ApplicationController
  def index
    @people = Person.all
    @person = Person.new
  end

  def upload
     Person.import(params[:person][:file])
     flash[:notice] = "File was upload successfully."
     redirect_to root_path
  end


end
