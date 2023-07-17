import { Application } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"
import "controllers"
import 'flowbite';

const application = Application.start()
application.debug = false
Turbo.session.drive = true
window.Stimulus   = application
export { application }



