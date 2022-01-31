import {Controller} from "@hotwired/stimulus"
import $ from 'jquery'

export default class extends Controller {
	connect() {
		$(document).on('turbo:load',function(){
			$('.contents').css("height", `${$(window).height() - $('.nav').outerHeight()}`);
		})
	}
}
