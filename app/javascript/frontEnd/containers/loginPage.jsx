import React from 'react';
import LoginForm from './login';

class LoginPage extends React.Component {
  submit = values => {
    console.log('submit works',values)
  }

  render() {
    return <LoginForm onSubmit={this.submit} />
  }
}

export default LoginPage;
