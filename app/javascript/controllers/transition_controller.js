import { Controller } from "@hotwired/stimulus"
import { enter, leave } from "el-transition"

// Connects to data-controller="transition"
export default class extends Controller {
  static targets = ["item"]

  itemTargetConnected(element) {
    enter(element)
  }

  close() {
    this.itemTargets.forEach(element => leave(element))
  }
}
