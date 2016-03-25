require 'test_helper'

describe SequencesController do
  it 'responds successfully with an HTTP 200 status code' do
    xhr :post, :create, {sequence: "a  =>  \nb  =>  c\nc  =>  "}

    response.status.must_equal 200
  end
end
