import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    this.url = this.data.get("url")
  }
  turbolink() {
    Turbolinks.visit(this.url)
  }
}
