// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import { Sortable, Swap } from "sortablejs"
import { timers } from "jquery"
import Rails from "@rails/ujs"

Sortable.mount(new Swap());
export default class extends Controller {
  // static targets = [ "output" ]
  connect() {
    const placesElements = document.getElementsByClassName("day-places");
    // console.log(placesElements);
    Array.from(placesElements).forEach(element =>{
      Sortable.create(element, {
        onEnd: this.end.bind(this),
        swap: true,
        group: {name: "places"},
      })
    })
  }
  end(event) {
    // console.log("swapped item: ", event.swapItem.dataset)
    let draggedItem = Object.assign({},event.item.dataset)
    let swappedItem = Object.assign({}, event.swapItem.dataset)
    let id = event.item.dataset.dayId
    console.log(event)
    console.log(event.to)
    // console.log(id)//id of day within which the place has been moved
    let draggedItemJSON = JSON.stringify(draggedItem)
    let swappedItemJSON = JSON.stringify(swappedItem)
    let data = new FormData()
    data.append("draggedItem", draggedItemJSON)
    data.append("swappedItem", swappedItemJSON)
    // console.log(data.get("draggedItem"))
    console.log("Dragged: " ,data.get("draggedItem"), "Swapped: ", data.get("swappedItem"))

    Rails.ajax({
      url: this.data.get("url").replace(":id", id),
      type: 'PATCH',
      data: data
    })
  }
}
