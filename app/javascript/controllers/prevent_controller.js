import { Controller } from "@hotwired/stimulus"
import $ from 'jquery'

export default class extends Controller {
	connect() {
		$(window).keydown(function(event){
			if(event.keyCode == 13) {
				event.preventDefault();
				return false;
			}
		});
	}
}