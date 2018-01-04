class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :student_groups, dependent: :destroy


  # Get id's where not admin true
  @students = User.all.where.not('admin >= ?', true).all.ids

  @number_of_students = @students.length
  @group_size = 2
  @max_unique = (@number_of_students / @group_size) * (@number_of_students - 1)
  @iterations = @max_unique / @group_size

  @used_groups = [[84,86],[83,84],[82,86]]

private
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
      group.each do | member |
         present += 1 if used_group.include?(member)
      end
      if present == @group_size
        return true
        break
      end
    end
  end



  def self.generate_group
    @group_size.times.collect { get_random_id }
  end

  def self.get_random_id
    id = @students.sample

    # @students.delete_if { |student_id | student_id == id }
  end


end
