require 'rails_helper'

RSpec.describe PlcPort, type: :model do
  describe "validations" do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:ip_address) }
    it { should validate_presence_of(:port) }
  end
end
