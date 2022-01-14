import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check-current-user"
export default class extends Controller {
  connect() {
    if (this.currentUserId) {
      this.element.classList.remove("d-none")
    }
  }

  get currentUserId() {
    return document.querySelector("[name='current-user-id']").content
  }
}
