import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    this.myTshirtUrl = this.data.get("tshirtUrl")
  }
  turbolink() {
    Turbolinks.visit(this.myTshirtUrl)
  }
}
