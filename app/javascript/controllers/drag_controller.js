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

export default class extends Controller {
  // static targets = [ "output" ]

  connect() {
    Sortable.mount(new Swap());
    const placesElements = document.getElementsByClassName("day-places");
    // console.log(placesElements);
    Array.from(placesElements).forEach(element =>{
      Sortable.create(element, {
        onEnd: this.end.bind(this),
        swap: true,
        // inwardSwap: true,
        group: {name: "places"}
        // fallbackOnBody: true,
        // swapThreshold: 0.65
      })
    })
  }
  end(event) {
    // console.log(event)
    let id = event.item.dataset.id //id of day within which the place has been moved
    // console.log(id)
    // let data = new FormData()
    // console.log(data.append(id, event.newIndex))

    // Rails.ajax({
    //   url: this.data.get("url").replace(":id", id),
    //   type: 'PATCH',
    //   data: data
    // })
  }
}
