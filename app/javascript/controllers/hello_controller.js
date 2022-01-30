import { Controller } from "@hotwired/stimulus"
import $ from 'jquery'

export default class extends Controller {
    connect() {
        var interval = setInterval(update, 3000);
        $(window).on('focus', function () {
            interval = setInterval(update, 3000);
        });
        
        $(window).on('blur', function () {
            clearInterval(interval);
        });
        
        function update() {
            $('#users').load('/update');
        }
    }
}
