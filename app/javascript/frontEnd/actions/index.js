export function createTshirt(body, callback) {
  const request = fetch(`/tshirt/new`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(body)

  }).then(response => response.json()).then(callback);

  return {
    type: 'TSHIRT_CREATED',
    payload: request
  }
}
