require 'test_helper'

describe ParseJobsAndDetermineSequence do
  let(:result) { ParseJobsAndDetermineSequence.call(content: "a  =>  \nb  =>  c\nc  =>  ") }

  it 'succeeds' do
    result.success?.must_equal true
  end
end
