import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "icon" ]

  connect() {
    console.log("favorite-btn")
    this.iconTarget.textContent="NO"
  }

  toggle(){
    console.log("toggle")
    this.iconTarget.textContent="YES"
  }


}
