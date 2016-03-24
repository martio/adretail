require 'test_helper'

describe ParseJobs do
  let(:result) { ParseJobs.call(content: "a  =>  \nb  =>  c\nc  =>  ") }

  it 'succeeds' do
    result.success?.must_equal true

    result.jobs.count.must_equal 3

    result.jobs[0].must_be_instance_of Job
    result.jobs[1].must_be_instance_of Job
    result.jobs[2].must_be_instance_of Job

    result.jobs[0].name.must_equal 'a'
    result.jobs[0].dependency.must_be_nil

    result.jobs[1].name.must_equal 'b'
    result.jobs[1].dependency.must_equal 'c'

    result.jobs[2].name.must_equal 'c'
    result.jobs[2].dependency.must_be_nil
  end
end
