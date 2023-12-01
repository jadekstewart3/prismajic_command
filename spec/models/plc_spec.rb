require 'rails_helper'

RSpec.describe Plc, type: :model do
  describe "realtionships" do 
    it { should have_many :ports }
    it { should have_many(:coils).through(:ports) }
  end

  describe "validations" do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :ip_address }
  end
end
