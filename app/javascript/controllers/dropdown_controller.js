import { Controller } from "@hotwired/stimulus"
import $ from 'jquery'

export default class extends Controller {
	connect() {
		$('.menu-btn').on('click',function (){
			$('#dropdown').toggleClass('show');
		})
		
		$(document).click(function (e) {
			e.stopPropagation();
			var container = $(".menu-btn");
			
			//check if the clicked area is dropDown or not
			if (container.has(e.target).length === 0) {
				$('#dropdown').removeClass('show');
			}
		})
	}
}