import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["copyButton", "textElement"];

    copy(event) {
        const textElement = this.textElementTarget;
        const text = textElement.textContent || textElement.innerText;

        navigator.clipboard.writeText(text)
            .then(() => {
                alert("Текст скопирован");
            })
            .catch((err) => {
                console.error("Ошибка при копировании текста:", err);
            });
    }
}
