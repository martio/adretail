class ParseJobs
  include Interactor

  def call
    context.jobs = []

    if not context.content.present? or context.content.empty?
      context.fail! error: 'content can\'t be empty'
    end

    jobs = []

    begin
      context.content.split(/\r?\n/).each do |item|
        result = item.partition('=>')

        if not result.kind_of?(Array) or not result.count == 3
          context.fail! error: 'incorrect format of sequence'
        end

        jobs << Job.new(name: result[0].strip, dependency: (result[2].strip.empty? ? nil : result[2].strip))
      end
    rescue Exception => e
      context.fail! error: e.message
    end

    context.jobs = jobs
  end
end
