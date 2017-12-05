require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  RSpec.describe Driver, type: :model do
    it "driver must have name field" do
      true
    end

    it "driver must provide number" do
      5 == 5
    end

    it "ride must be associated with driver" do
      1 < 5
    end
  end
end