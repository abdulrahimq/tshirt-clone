export function createTshirt(body) {
  const content = JSON.stringify(body);
  const request = fetch(`/api/v1/tshirts`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: content
  }).then(response => response.json());

  return {
    type: 'TSHIRT_CREATED',
    payload: request
  }
}
