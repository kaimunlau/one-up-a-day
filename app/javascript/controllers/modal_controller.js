import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"]

  newUpdate(event) {
    this.modalTarget.classList.remove('hidden')
  }

  close(event) {
    this.modalTarget.classList.add('hidden')
  }
}
