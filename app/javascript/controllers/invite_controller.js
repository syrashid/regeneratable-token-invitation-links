import { Controller } from "stimulus"
import { fetchWithToken } from "../utils/fetch_with_token";

export default class extends Controller {
  static targets = ['url'];

  copy() {
    this.urlTarget.select();
    this.urlTarget.setSelectionRange(0, 99999);

    document.execCommand("copy");
    $('.toast').toast('show');
  }

  regenerate() {
    const groupId = this.urlTarget.dataset.groupId;


  }
}
