require 'rails_helper'

RSpec.describe Port, type: :model do
  describe "relationships" do 
    it { should belong_to :plc }
  end

  describe "validations" do 
    it { should validate_presence_of :description }
    it { should validate_presence_of :port_number }
  end
end
