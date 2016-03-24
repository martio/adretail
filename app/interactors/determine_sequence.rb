class DetermineSequence
  include Interactor

  def call
    context.sequence = []

    return if context.jobs.empty?

    sequence = {}

    context.jobs.each do |job|
      if job.dependency == job.name
        context.fail! error: 'jobs can\'t depend on themselves'
      end

      sequence[job.name] = [job.dependency].compact
    end

    begin
      sequence = sequence.tsort
    rescue TSort::Cyclic
      context.fail! error: 'jobs can\'t have circular dependencies'
    rescue Exception
      context.fail!
    end

    context.sequence = sequence
  end
end
