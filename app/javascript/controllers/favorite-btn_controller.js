import { Controller } from "stimulus"
import { library, dom } from '@fortawesome/fontawesome-svg-core'
import { faHeart as like} from '@fortawesome/free-regular-svg-icons'
import { faHeart as liked} from '@fortawesome/free-solid-svg-icons'


export default class extends Controller {
  static targets = [ "text","icon" ]

  initialize(){
    
    library.add([like,liked])
    dom.watch()
  }

  connect() {
    console.log("favorite-btn")
    this.btnState = false
  }

  toggle(){
    console.log("toggle")
    if (this.btnState){
      this.textTarget.textContent="like"
      this.iconTarget.classList.remove("fa-solid")
      this.iconTarget.classList.add("fa-regular")
    }else{
      this.textTarget.textContent="liked"
      this.iconTarget.classList.remove("fa-regular")
      this.iconTarget.classList.add("fa-solid")
    }
    this.btnState=!this.btnState
  }


}
