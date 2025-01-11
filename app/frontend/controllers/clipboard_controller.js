import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["copyButton", "textElement"];

    copy(event) {
        const textElement = this.textElementTarget;
        const text = textElement.textContent || textElement.innerText;

        if (navigator.clipboard && navigator.clipboard.writeText) {
            navigator.clipboard.writeText(text)
                .then(() => {
                    alert("Текст скопирован");
                })
                .catch((err) => {
                    console.error("Ошибка при копировании текста:", err);
                });
        } else {
            // Альтернативное копирование через временный элемент
            const tempInput = document.createElement("textarea");
            tempInput.value = text;
            document.body.appendChild(tempInput);
            tempInput.select();
            try {
                document.execCommand("copy");
                alert("Текст скопирован");
            } catch (err) {
                console.error("Ошибка при копировании текста через execCommand:", err);
            }
            document.body.removeChild(tempInput);
        }
    }
}
