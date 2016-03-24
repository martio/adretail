require 'test_helper'

describe SortJobs do
  let(:job) { Job.new(name: 'x') }
  let(:result) { SortJobs.call(jobs: [job]) }

  it 'succeeds' do
    result.success?.must_equal true
  end

  describe 'case 1' do
    it 'returns correct sequence' do
      result = SortJobs.call(jobs: [])
      result.jobs.must_equal []
    end
  end

  describe 'case 2' do
    it 'returns correct sequence' do
      result = SortJobs.call(jobs: [Job.new(name: 'a')])
      result.jobs.must_equal ['a']
    end
  end

  describe 'case 3' do
    it 'returns correct sequence' do
      result = SortJobs.call(jobs: [
        Job.new(name: 'a'),
        Job.new(name: 'b'),
        Job.new(name: 'c')
      ])
      result.jobs.must_equal ['a', 'b', 'c']
    end
  end

  describe 'case 4' do
    it 'returns correct sequence' do
      result = SortJobs.call(jobs: [
        Job.new(name: 'a'),
        Job.new(name: 'b', dependency: 'c'),
        Job.new(name: 'c')
      ])
      result.jobs.must_equal ['a', 'c', 'b']
    end
  end

  describe 'case 5' do
    it 'returns correct sequence' do
      result = SortJobs.call(jobs: [
        Job.new(name: 'a'),
        Job.new(name: 'b', dependency: 'c'),
        Job.new(name: 'c', dependency: 'f'),
        Job.new(name: 'd', dependency: 'a'),
        Job.new(name: 'e', dependency: 'b'),
        Job.new(name: 'f')
      ])
      result.jobs.must_equal ['a', 'f', 'c', 'b', 'd', 'e']
    end
  end

  describe 'case 6' do
    it 'returns correct sequence' do
      result = SortJobs.call(jobs: [
        Job.new(name: 'a'),
        Job.new(name: 'b'),
        Job.new(name: 'c', dependency: 'c')
      ])
      result.failure?.must_equal true
    end
  end

  describe 'case 7' do
    it 'returns correct sequence' do
      result = SortJobs.call(jobs: [
        Job.new(name: 'a'),
        Job.new(name: 'b', dependency: 'c'),
        Job.new(name: 'c', dependency: 'f'),
        Job.new(name: 'd', dependency: 'a'),
        Job.new(name: 'e'),
        Job.new(name: 'f', dependency: 'b')
      ])
      result.failure?.must_equal true
    end
  end
end
