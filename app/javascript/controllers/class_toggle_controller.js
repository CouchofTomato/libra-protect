import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="class-toggle"
export default class extends Controller {
  static targets = ["toggle"];

  switch() {
    this.toggleTargets.forEach((element) => {
      const classes = element.dataset.toggleClasses.split(" ");
      classes.forEach((className) => element.classList.toggle(className));
    });
  }
}
