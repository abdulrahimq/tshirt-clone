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
    credentials: 'include',
    body: formData,
    contentType: false,
    processData: false
  }).then(response => response.json());

  return {
    type: 'TSHIRT_CREATED',
    payload: request
  }
}

export function toggleIsLoggedIn(loggedInValue) {
  return {
    type: 'TOGGLE_IS_LOGGED_IN',
    payload: loggedInValue
  }
}

export function fetchTshirts() {
  const request = fetch('api/v1/tshirts').then(res => res.json())
  .then(data => {
    console.log(data);
    return data
  });

  return {
    type: 'FETCH_TSHIRTS',
    payload: request
  }
}


