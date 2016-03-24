require 'test_helper'

describe DetermineSequence do
  let(:result) { DetermineSequence.call(content: "a  =>  \nb  =>  c\nc  =>  ") }

  it 'succeeds' do
    result.success?.must_equal true
  end
end
