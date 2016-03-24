class SortJobs
  include Interactor

  def call
    return if context.jobs.empty?

    jobs = {}

    context.jobs.each do |job|
      if job.dependency == job.name
        context.fail! error: 'jobs can\'t depend on themselves'
      end

      jobs[job.name] = [job.dependency].compact
    end

    begin
      jobs = jobs.tsort
    rescue TSort::Cyclic
      context.fail! error: 'jobs can\'t have circular dependencies'
    rescue Exception
      context.fail!
    end

    context.jobs = jobs
  end
end
