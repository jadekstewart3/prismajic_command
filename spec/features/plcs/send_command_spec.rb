require "rails_helper"

RSpec.describe "Send Command" do 
  context "When I visit the PLC show page" do 
    context "I see a form to send a command" do 
      context "When Successful" do
        before :each do 
          @plc = Plc.create!(name: "Owl Nest", ip_address: "192.168.10.21")
          @port = @plc.ports.create!(description: "Led Light", port_number: 5002)
          visit plc_path(@plc)
        end
        it "Displays a success message if the command was sent successfully" do 
          select("Led Light", :from => "Port:")
          choose(:udp_command_1)
          click_button "Submit"
          expect(page).to have_content("Command sent successfully!")
        end
      end

      context "When unsuccessful" do
        xit "displays an error message if a port was not selected" do 
          choose(:udp_command_1)
          click_button "Submit"
          expect(page).to have_content("Please select a port.")
        end
      end
    end
  end
end