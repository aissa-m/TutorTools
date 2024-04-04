const API_ENDPOINT = '../../api.php'
function fetchBackend(action, data) {
    return fetch(API_ENDPOINT, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ action, data }),
    });
  }
  