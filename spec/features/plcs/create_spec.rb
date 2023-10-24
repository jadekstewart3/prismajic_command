require "rails_helper"

RSpec.describe "Create PLC" do 
  context "As a user" do 
    context "When I visit the '/plc/new'" do 
      context "When successful" do 
        it "fills in the form to create a new plc" do 
          name = "Tree Branch"
          ip_address = "192.168.10.22"

          visit new_plc_path
      
          fill_in :plc_name, with: name 
          fill_in :plc_ip_address, with: ip_address

          click_button "Create"

          new_plc = Plc.last

          expect(current_path).to eq(plc_path(new_plc))
        end
      end

      context "When unsuccessful" do 
        it "does not create a new plc without a valid ip address" do 
          name = "pagoda"
          ip_address = "192.68.10.233271893"

          visit new_plc_path

          fill_in :plc_name, with: name
          fill_in :plc_ip_address, with: ip_address

          click_button "Create"

          expect(current_path).to eq(new_plc_path)
          expect(page).to have_content("Ip address is not a valid IP address")
        end

        it "does not create a plc without a name" do 
          name = ""
          ip_address = "192.168.10.24"

          visit new_plc_path

          fill_in :plc_name, with: name
          fill_in :plc_ip_address, with: ip_address

          click_button "Create"

          expect(current_path).to eq(new_plc_path)
          expect(page).to have_content("Name can't be blank")
        end

        it "does not create a new plc without a ip_address" do 
          name = "dragon"
          ip_address = ""

          visit new_plc_path

          fill_in :plc_name, with: name
          fill_in :plc_ip_address, with: ip_address

          click_button "Create"

          expect(current_path).to eq(new_plc_path)
          expect(page).to have_content("Ip address is not a valid IP address, Ip address can't be blank")
        end
      end
    end
  end
end