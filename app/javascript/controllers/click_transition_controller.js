import { Controller } from "@hotwired/stimulus"
import { enter, leave, toggle } from "el-transition"

// Connects to data-controller="click-transition"
export default class extends Controller {
  static targets = ["item"]

  toggleMenu() {
    toggle(this.itemTarget)
  }
}
