import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "slide" ]
  static values = { index: Number }
  
  initialize() {
    this.showCurrentSlide()
  }

  next() {
    this.indexValue++
    if (this.indexValue >= this.slideTargets.length) {
      this.indexValue = 0
    }
  }

  previous() {
    this.indexValue--
    if (this.indexValue < 0 ) {
      this.indexValue = this.slideTargets.length - 1
    }
  }

  indexValueChanged() {
    this.showCurrentSlide()
  }

  showCurrentSlide() {
    this.slideTargets.forEach((element, index) => {
      element.hidden = index != this.indexValue
    })
  }
}