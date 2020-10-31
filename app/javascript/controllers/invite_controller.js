import { Controller } from "stimulus"
import { fetchWithToken } from "../utils/fetch_with_token";

export default class extends Controller {
  static targets = ['url'];

  copy() {
    this.urlTarget.select();
    this.urlTarget.setSelectionRange(0, 99999);

    document.execCommand("copy");

    document.querySelector(".toast-body").innerHTML = "Link copied to clipboard!"
    $('.toast').toast('show');
  }

  async regenerate() {
    const groupId = this.urlTarget.dataset.groupId;
    const response = await fetch(`/groups/${groupId}/invite_link`, { headers: { accept: "application/json" } });
    const data = await response.json();

    this.urlTarget.value = data.link;
    this.urlTarget.setAttribute('value', data.link);
    document.querySelector(".toast-body").innerHTML = "Fresh link generated!"
    $('.toast').toast('show');
  }
}
