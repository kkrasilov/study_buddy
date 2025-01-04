import { Application } from "@hotwired/stimulus"
import toast from './toast'
window.toast = toast;

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
