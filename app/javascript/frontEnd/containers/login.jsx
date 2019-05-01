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


// so the session cookie is automatically sent with the header each time - you just
// need to send the form submit over to json endpoint of devise , then
// the response (i think, should automatically be set in the header. )
