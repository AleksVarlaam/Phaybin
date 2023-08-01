import { Controller } from "@hotwired/stimulus"
import { patch } from "@rails/request.js"
import Sortable from "sortablejs"

export default class extends Controller {
    connect() {
        this.sortable = new Sortable(this.element, {
            onEnd: async (e) => {
                try {
                    this.disable()
                    
                    const galleryId = e.from.id.split('_').pop()
                    const resp = await patch(this.reorderPath(e), {
                        body: JSON.stringify({
                            "new_position": e.newIndex + 1,
                            "old_position": e.oldIndex + 1,
                        })
                    })
                    
                    if(!resp.ok) {
                        throw new Error('Cannot reorder: ${resp.statusCode}')
                    }
                } catch(e) {
                    console.error(e)
                } finally {
                  this.enable()
                }
            }
        })
    }
    
    reorderPath(e) {
        const galleryId = e.from.id.split('_').pop()
        
        const path = e.from.id.includes("images") 
            ? "/galleries/" + galleryId + "/images/reorder" 
            : "/galleries/reorder"
        return path
    }
    
    disable() {
        this.sortable.option('disabled', true)
        this.sortable.el.classList.add('opacity-50')
    }

    enable() {
        this.sortable.option('disabled', false)
        this.sortable.el.classList.remove('opacity-50')
    }

    updatePositions() {
        this.positionTargets.forEach((position, index) => {
            position.innerText = index + 1
        })
    }
}
