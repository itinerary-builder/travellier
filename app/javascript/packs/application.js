// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import initScrollNav from "../plugins/init_scroll_nav";
import initTyped from "../plugins/init_typed";
import initAddAirplane from "../plugins/init_add_airplane";
import initAddScrollhover from "../plugins/init_add_scrollhover";
import initAddFormToggle from "../plugins/init_add_form_toggle";
import initMapbox from "../plugins/init_mapbox";
import "mapbox-gl/dist/mapbox-gl.css";
import itineraryModal from "../plugins/itinerary_modal";
import initAjaxPlaces from "../plugins/init_ajax_places";
import initPrintFunc from "../plugins/init_print_function";

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initScrollNav();
  initTyped();
  initAddAirplane();
  initAddScrollhover();
  initAddFormToggle();
  initMapbox();
  itineraryModal();
  initAjaxPlaces();
  initPrintFunc();
});

import "controllers"
