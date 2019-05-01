export function createTshirt(body, token) {
  const content = JSON.stringify(body);
  const request = fetch(`/api/v1/tshirts`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Authorization" : `Bearer ${token}`
    },
    body: content
  }).then(response => response.json());

  return {
    type: 'TSHIRT_CREATED',
    payload: request
  }
}

export function setToken(token) {
  return {
    type: 'SET_TOKEN',
    payload: token
  }
}
