import React from 'react';
import { Field, reduxForm } from 'redux-form'

const SignInForm = props => {
  return(
    <form onSubmit={props.handleSubmit}>
      <Field name="email" component="input" type="text" />
      <Field name="password" component="input" type="text" />
    </form>
  );
}

export default reduxForm({
  form: 'signIn' // a unique identifier for this form
})(SignInForm)
