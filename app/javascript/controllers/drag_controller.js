// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import { Sortable } from "sortablejs"
import { timers } from "jquery"

export default class extends Controller {
  // static targets = [ "output" ]

  connect() {
   this.sortable = Sortable.create(this.element, {
     onEnd: this.end.bind(this)
   })
  }
  end(event) {
    console.log(event)
    let data = new FormData()
    data.append({position: event.newIndex + 1})
    Rails.ajax({
      url: '',
      type: 'PATCH',
      data: data
    })
  }
}
