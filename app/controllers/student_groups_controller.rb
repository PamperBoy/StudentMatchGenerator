class StudentGroupsController < ApplicationController

  def index
    @groups = StudentGroup.all
  end

end
