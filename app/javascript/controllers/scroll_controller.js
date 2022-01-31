import { Controller } from "@hotwired/stimulus"
import $ from 'jquery'

export default class extends Controller {
	connect() {
		$(document).on('turbo:render', function () {
			var element = $('.convo');
			element.scrollTop(element.prop("scrollHeight"));
		})
	}
}