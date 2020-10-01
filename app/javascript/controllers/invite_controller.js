import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['url'];

  copy() {
    this.urlTarget.select();
    this.urlTarget.setSelectionRange(0, 99999);

    document.execCommand("copy");
    $('.toast').toast('show');
  }

  regenerate() {

  }
}
