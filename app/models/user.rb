class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :student_groups, dependent: :destroy


  # Get id's where not admin true
  @students = User.all.where('admin = ?', false).all.ids

  @students_duplicate = @students.dup
  @number_of_students = @students_duplicate.length
  @group_size = 2
  @max_groups_per_day = @number_of_students / @group_size
  @max_unique = @max_groups_per_day * (@number_of_students - 1)
  @iterations = @max_unique / @max_groups_per_day

  @used_groups = []

private
  def self.create_groups
    per_day = @max_groups_per_day.dup
    puts "start"
    while per_day > 0 do

      first = get_random_id
      @students_duplicate.delete(first)

      second = get_random_id
      @students_duplicate.delete(second)

      group = generate_group(first, second)
      if check_group_used(group) == true
        @students_duplicate << first
        @students_duplicate << second

        if @students_duplicate.length == @group_size
          @students_duplicate << @used_groups.last(@group_size - 1).flatten
            print "asdasdasfasdasd"
            redo
        end
      end


        # @students_duplicate.delete(first)
        # @students_duplicate.delete(second)

      @used_groups << group
      per_day -= 1
      reset_all and break if @max_unique == @used_groups.length
    end
    puts "========================="
    print "used groups:\n"
    @used_groups.in_groups_of(@max_groups_per_day) {|group| p group}

    @students_duplicate = @students.dup
    per_day = @max_groups_per_day.dup


  end

  def self.reset_all
    @used_groups = []
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



  def self.generate_group(*args)
    args.collect { |arg| arg}
  end

  def self.get_random_id
    @students_duplicate.sample

  end


end
