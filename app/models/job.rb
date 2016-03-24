class Job
  include ActiveModel::Model

  attr_accessor :name, :dependency

  validates_presence_of :name
end
