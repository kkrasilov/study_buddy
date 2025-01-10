import './application.scss'
import toast from './toast'
import 'trix'
import 'preline'
import '@preline/overlay'
import '@rails/actiontext'
import 'flowbite';
import "@hotwired/turbo-rails"
import "../controllers"

window.toast = toast;


document.addEventListener("DOMContentLoaded", () => {
    const copyToken = document.getElementById("token-copy-button");
    const tokenText = document.getElementById("group-token");

    if (copyToken && tokenText) {
        copyToken.addEventListener("click", () => {
            const text = tokenText.textContent || tokenText.innerText;
            navigator.clipboard.writeText(text).then(() => {
                alert("Токен скоприрован");
            }).catch((err) => {
                console.error("Failed to copy text: ", err);
            });
        });
    }

    const copyUrlToken = document.getElementById("token-url-copy-button");
    const tokenUrlText = document.getElementById("group-url-with-token");

    if (copyUrlToken && tokenUrlText) {
        copyUrlToken.addEventListener("click", () => {
            const text = tokenUrlText.textContent || tokenUrlText.innerText;
            navigator.clipboard.writeText(text).then(() => {
                alert("Ссылка скоприрована");
            }).catch((err) => {
                console.error("Failed to copy text: ", err);
            });
        });
    }
});
