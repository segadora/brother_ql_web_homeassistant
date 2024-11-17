# Brother QL Web home assistant addon repository

This repository can be installed into home assistant and allow you to install a docker image with brother ql web.

Add-on documentation: <https://developers.home-assistant.io/docs/add-ons>

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fsegadora%2Fbrother_ql_web_homeassistant)

## Brother QL Web

This repository uses a fork of brother ql web by [FriedrichFroebel/brother_ql_web](https://github.com/FriedrichFroebel/brother_ql_web)

## Configuration

Add the following code to `configuration.yaml` in your home assistant config folder. 

```yaml
rest_command:
  label_printer_print:
    url: 'http://homeassistant.local:8013/api/print/text?text={{ text }}&font_size={{ font_size }}&font_family=DejaVu%20Serif%20(Book)&label_size={{ label_size }}'
    method: GET
    content_type: 'application/json; charset=utf-8'
```

Then you can add scripts like the following. It prints todays date to the label

```yaml
print_todays_date_on_label_maker:
  alias: 'Print: Print todays date on label maker'
  sequence:
  - action: rest_command.label_printer_print
    metadata: {}
    data:
      text: '{{ now().strftime(''%d-%m-%y %H:%M:%S'') }}'
      label_size: '17x87'
      font_size: '100'
```

Example of button card

![button card](/docs/button_card.png)

```yaml
show_name: true
show_icon: true
type: button
name: Print label
tap_action:
  action: perform-action
  perform_action: script.print_todays_date_on_label_maker
icon: mdi:calendar
hold_action:
  action: none
grid_options:
  columns: 6
  rows: 2
```