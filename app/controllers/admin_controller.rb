class AdminController < ApplicationController



  def index
  	@versions = Version.all
    
  end



end
