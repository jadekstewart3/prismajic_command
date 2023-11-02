require "rails_helper"

RSpec.describe "Send Command" do 
  context "When I visit the PLC show page" do 
    let(:plc) { Plc.create!(name: "Owl Nest", ip_address: "192.168.10.21") }
    let(:port) { Port.create!(description: "Led Light", port_number: 5002, plc_id: plc.id) }
    context "I see a form to send a command" do 
      context "When Successful" do
        it "Displays a success message if the command was sent successfully" do 
          visit plc_path(plc)
   
          select("Led Light", :from => "Port:")
          choose(:udp_command_1)
          click_button "Submit"
          expect(page).to have_content("Command sent successfully!")
        end
      end

      context "When unsuccessful" do
        it "displays an error message if a port was not selected" do 
          visit plc_path(plc)
          choose(:udp_command_1)
          click_button "Submit"
          expect(page).to have_content("Please select a port.")
        end
      end
    end
  end
end