require 'rails_helper'

RSpec.describe SchoolSeederJob, type: :job do
  describe "perform" do
    it "should populate the schools table" do
      described_class.new.perform
      expect(School.count).to eql(202)
    end
  end
end
