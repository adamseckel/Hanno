module ProjectsHelper

  def done_tasks(project)
    @done = 0
    project.tasks.each do |task|
      if task.done 
        @done += 1
      end
    end
    return @done
  end

  def percent_done(project)
    @percent = done_tasks(project).to_f/project.tasks.count.to_f
    @percent = @percent * 100
    return @percent
  end

  def date_time(date)
  end


end
