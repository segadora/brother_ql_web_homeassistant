## brother\_ql\_web

This is a web service to print labels on Brother QL label printers.

### Usage

Once it's running, access the web interface by opening the page with your browser.
If you run it on your local machine, go to <http://homeassistant.local:8013>.
You will then be forwarded by default to the interactive web gui located at `/labeldesigner`.

All in all, the web server offers:

* a Web GUI allowing you to print your labels at `/labeldesigner`,
* an API at `/api/print/text?text=Your_Text&font_size=100&font_family=Minion%20Pro%20(%20Semibold%20)`
  to print a label containing 'Your Text' with the specified font properties.
