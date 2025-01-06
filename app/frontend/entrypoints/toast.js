function success(message) {
  show('success', message);
}

function error(message) {
  show('error', message);
}

function info(message) {
  show('info', message);
}

function show(type, message) {
  const body = document.body;

  if (body && !body.contains(document.querySelector('.uiToastBlock'))) {
    const toastBlock = document.createElement('div');

    toastBlock.classList.add('uiToastBlock');
    body.append(toastBlock);
  }

  const toast = document.createElement('div');

  function remove() {
    toast.remove();
  }

  toast.classList.add('uiToast', `${type}Toast`, 'v-theme--light');
  toast.setAttribute('data-test', `toast-${type}`);
  toast.innerHTML = message;
  toast.addEventListener('click', remove);

  document.querySelector('.uiToastBlock')?.append(toast);

  setTimeout(() => toast.classList.add('uiToastVisible'), 200);
  setTimeout(() => toast.classList.remove('uiToastVisible'), 4800);

  setTimeout(() => {
    toast.removeEventListener('click', remove);
    toast.remove();
    if (body && !body.contains(document.querySelector('.uiToast'))) {
      document.querySelector('.uiToastBlock')?.remove();
    }
  }, 5000);
}

const toast = { success, error, info };

export default toast;
