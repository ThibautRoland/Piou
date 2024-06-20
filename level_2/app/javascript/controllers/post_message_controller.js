import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post-message"
export default class extends Controller {
  connect() {
    console.log("hello from post message controller");
  }
}
