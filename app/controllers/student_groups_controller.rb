class StudentGroupsController < ApplicationController

  def tester(group)
    User.check_group_used(group)
  end

end
