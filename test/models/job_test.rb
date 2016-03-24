require 'test_helper'

describe Job do
  let(:job) { Job.new(name: 'x') }

  it 'passes a validation' do
    job.valid?.must_equal true
  end
end
