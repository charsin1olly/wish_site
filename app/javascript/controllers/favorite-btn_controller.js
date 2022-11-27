import { Controller } from "stimulus"
import { library, dom } from '@fortawesome/fontawesome-svg-core'
import { faHeart as like} from '@fortawesome/free-regular-svg-icons'
import { faHeart as liked} from '@fortawesome/free-solid-svg-icons'


export default class extends Controller {
  static targets = [ "icon" ]

  initialize(){
    library.add([like,liked])
    dom.watch()
  }

  connect() {
    console.log("favorite-btn")
    this.setLikeStatus(this.element.dataset.liked === "true");
  }

  toggle(){
    // console.log("toggle")
    const token =document.querySelector("meta[name='csrf-token']").content
    const id = this.element.dataset.id;
    // PATCH一定要大寫
    fetch(`/wish_lists/${id}/like`, {
      method: "PATCH" ,
      headers: {
      "X-CSRF-Token": token,
      },
      })
    .then((resp)=>{
      // console.log(resp)
      return resp.json()})
    .then(({status})=>{
      //抓到的資料是不是liked
      this.setLikeStatus(status === "liked");
    })
    .catch((err)=>{console.log(err)})

  }
  setLikeStatus(status){
    if (status){
      this.iconTarget.classList.remove("fa-regular")
      this.iconTarget.classList.add("fa-solid")
    }else{
      this.iconTarget.classList.remove("fa-solid")
      this.iconTarget.classList.add("fa-regular")
    }
  }

}
