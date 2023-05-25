import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Manage your own lists of movies..", "And never forget them!"],
      typeSpeed: 50,
      loop: true
    })
  }
}
