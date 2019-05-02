export function createTshirt(body, token) {

  const formData = new FormData();
  formData.append('tshirt[name]', body.name)
  formData.append("tshirt[description]", body.description)
  formData.append('tshirt[photo]', body.photo)

  const request = fetch(`/api/v1/tshirts`, {
    method: "POST",
    headers: {
      "Authorization" : `Bearer ${token}`
    },
    body: formData,
    contentType: false,
    processData: false
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
