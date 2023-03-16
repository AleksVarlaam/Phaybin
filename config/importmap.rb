# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

pin "flowbite", to: "https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.turbo.min.js"
pin 'stimulus-dropdown', to: 'https://ga.jspm.io/npm:stimulus-dropdown@2.1.0/dist/stimulus-dropdown.mjs', preload: true
pin 'hotkeys-js', to: 'https://ga.jspm.io/npm:hotkeys-js@3.10.1/dist/hotkeys.esm.js', preload: true
pin 'stimulus-use', to: 'https://ga.jspm.io/npm:stimulus-use@0.51.3/dist/index.js', preload: true
pin 'stimulus-popover', to: 'https://ga.jspm.io/npm:stimulus-popover@6.2.0/dist/stimulus-popover.mjs', preload: true
pin 'stimulus-scroll-to', to: 'https://ga.jspm.io/npm:stimulus-scroll-to@4.1.0/dist/stimulus-scroll-to.mjs', preload: true