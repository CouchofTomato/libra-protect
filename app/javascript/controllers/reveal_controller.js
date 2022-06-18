import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reveal"
export default class extends Controller {
  static targets = ['content'];

  toggle(e) {
    e.preventDefault();
    const category = e.target.dataset.category;

    this.contentTargets.forEach(target => {
      if (target.dataset.category === category) {
        target.classList.remove('hidden');
      } else {
        target.classList.add('hidden');
      }
    });
  }
}
