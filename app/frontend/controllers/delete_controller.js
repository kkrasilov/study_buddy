import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["button"];

    confirmDelete(event) {
        const isConfirmed = confirm('Вы уверены?');
        if (!isConfirmed) {
            event.preventDefault();
        }
    }
}
