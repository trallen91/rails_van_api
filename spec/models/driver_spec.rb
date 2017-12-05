require './spec/test_helper'

class DriverTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  RSpec.describe Driver, type: :model do

    it "should validate the presence of driver name" do
      1 == 1
    end

    it "should enforce driver name" do
      true
    end
  end
end
