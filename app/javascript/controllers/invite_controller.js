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
    const groupToken = this.urlTarget.dataset.groupToken;
    const response = await fetch(`/groups/${groupToken}/invite_link`, { headers: { accept: "application/json" } });
    const data = await response.json();

    this.urlTarget.value = data.link;
    this.urlTarget.setAttribute('data-group-token', data.invite_token);
    this.urlTarget.setAttribute('value', data.link);
    document.querySelector(".toast-body").innerHTML = "Fresh link generated!"
    $('.toast').toast('show');
  }
}
