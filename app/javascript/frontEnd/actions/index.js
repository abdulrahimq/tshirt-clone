export function createTshirt(body, callback) {
  console.log(JSON.stringify(body));
  const request = fetch(`/tshirts/new`, {
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
