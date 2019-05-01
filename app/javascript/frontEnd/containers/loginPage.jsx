import React from 'react';
import LoginForm from './login';

class LoginPage extends React.Component {
  submit = values => {
    console.log('submit works',values)
    const data = {
      email: values.email,
      password: values.password
    }
    fetch('/api/v1/auth', {
      method: 'POST',
      body: JSON.stringify(data),
      headers: {
        'Content-Type' : 'application/json'
      }
    }).then( res => res.json())
    .then(data => {
       localStorage.setItem("token", data.token)
    })
    .catch(error => console.error('Error:', error));
  }

  render() {
    return <LoginForm onSubmit={this.submit} />
  }
}

export default LoginPage;
