import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check-author"
export default class extends Controller {
  static targets = [ 'delete' ]
  static values = {
    authorId: String
  }

  connect() {
    if (this.currentUserId === this.authorId) {
      this.element.classList.remove("d-none")
      // this.deleteTarget.classList.remove("d-none")
    }
  }

  get authorId() {
    return this.authorIdValue
  }

  get currentUserId() {
    return document.querySelector("[name='current-user-id']").content
  }
}
