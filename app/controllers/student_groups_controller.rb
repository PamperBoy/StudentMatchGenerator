class StudentGroupsController < ApplicationController

  # Get id's where not admin true
  @students = User.all.where.not('admin >= ?', true).all.ids

  @number_of_students = @students.length
  @group_size = 2
  @max_unique = (@number_of_students / @group_size) * (@number_of_students - 1)
  @iterations = @max_unique / @group_size

  @used_numbers = []
  @used_groups = [[84,86]]




  def self.create_groups
    print @students
    puts
    group = generate_group
    print @students
    puts

    @used_numbers.concat( group )

    print @used_numbers

  end


  def self.check_group_used(group)
    @used_groups.each do | used_group |
      present = 0
      print used_group
      puts

      group.each do | member |
        puts member
         present += 1 if used_group.include?(member)
      end
      puts "yup" if present == @group_size
    end
  end

  def self.reset_used_numbers
    @used_numbers = []
  end

  def self.generate_group
    @group_size.times.collect { get_random_id }
  end

  def self.get_random_id
    id = @students.sample

    @students.delete_if { |student_id | student_id == id }
  end


end

# Collection numbers
# Max iterations
# Max unique possibilities
# Set date on click
# Pick random number
# Pick another random number
# Check if pair has been used before
# If used before generate new pair
# If not used before store in combinations used
# Remove numbers so they can't be used in current iteration
# Store pair in used pairs
# Remove 1 from max possibilities
# Store in db with date
#
# Restore numbers used in iteration
# Check if max unique possibilities is 0
# Reset stored numbers
# Reset max possibilities
# Reset used pairs
