require 'test_helper'

describe HomeController do
  it 'responds successfully with an HTTP 200 status code' do
    get :index

    response.status.must_equal 200
  end
end
