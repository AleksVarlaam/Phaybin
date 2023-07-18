import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input"]

    preview() {
        var input = this.inputTarget
        var files = input.files
        var imgLoc = document.getElementById("Img")
        for (var i = 0; i < files.length; i++) {
            let reader = new FileReader()
            reader.onload = function() {
                let image = document.createElement("img")
                imgLoc.appendChild(image)
                image.style.height = '100px'
                image.style.display = 'block'
                image.style.margin = '10px auto 10px'
                image.src = reader.result
            }
            reader.readAsDataURL(files[i])
        }
    }
    
    
    cover_mobile_preview() {
        var input = this.inputTarget
        var files = input.files
        var imgLoc = document.getElementById("CoverMobile")
        for (var i = 0; i < files.length; i++) {
            let reader = new FileReader()
            reader.onload = function() {
                let image = document.createElement("Img")
                imgLoc.appendChild(image)
                image.style.height = '100px'
                image.style.display = 'block'
                image.style.margin = '10px auto 10px'
                image.src = reader.result
            }
            reader.readAsDataURL(files[i])
        }
    }
    
    cover_desktop_preview() {
        var input = this.inputTarget
        var files = input.files
        var imgLoc = document.getElementById("CoverDesktop")
        for (var i = 0; i < files.length; i++) {
            let reader = new FileReader()
            reader.onload = function() {
                let image = document.createElement("Img")
                imgLoc.appendChild(image)
                image.style.height = '100px'
                image.style.display = 'block'
                image.style.margin = '10px auto 10px'
                image.src = reader.result
            }
            reader.readAsDataURL(files[i])
        }
    }
}