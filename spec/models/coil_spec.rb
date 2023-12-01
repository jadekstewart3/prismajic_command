require 'rails_helper'

RSpec.describe Coil, type: :model do
  describe "relationships" do 
    it { should belong_to :port }
    it { should have_one(:plc).through(:port) }
  end

  describe "validations" do 
    it { should validate_presence_of :address }
  end
end
