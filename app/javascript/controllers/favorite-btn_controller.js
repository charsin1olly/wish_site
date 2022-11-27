import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "icon" ]

  initialize(){
    this.btnState = false
  }

  connect() {
    console.log("favorite-btn")
    
  }

  toggle(){
    console.log("toggle")
    if (this.btnState){
      this.btnState = true
      this.iconTarget.textContent="NO"
    }else{
      this.btnState = false
      this.iconTarget.textContent="YES"
    }
    this.btnState=!this.btnState
  }


}
