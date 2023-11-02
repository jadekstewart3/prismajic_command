$(document).addEventListener('DOMContentLoaded',function () {
  // Handle adding new port fields
  $('#add_port').on(function () {
    var portFields = $('#port_fields');
    var portTemplate = `
      <div class="port_fields">
        <label for="plc_ports_attributes_description">Description:</label>
        <input type="text" name="plc[ports_attributes][][description]" />
        <label for="plc_ports_attributes_port_number">Port Number:</label>
        <input type="text" name="plc[ports_attributes][][port_number]" />
        <button type="button" class="remove_port">Remove</button>
      </div>
    `;
    portFields.append(portTemplate);
  });

  // Handle removing port fields
  $('#port_fields').on('click', '.remove_port', function () {
    $(this).parent('.port_fields').remove();
  });
});
