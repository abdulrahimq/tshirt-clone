import React from 'react';
import { connect } from 'react-redux';
import { reduxForm, Field } from 'redux-form';
import { createTshirt } from '../actions';

class TshirtNew extends React.Component{
  renderField(field) {
    return (
      <div>
        <label>{field.label}</label>
        <input type={field.type} />
      </div>
    );
  }

  onSubmit = (values) => {
    this.props.createTshirt(values, (tshirt) => {
      this.props.history.push('/tshirts');
      return tshirt;
    })
  }

  render() {
    return(
      <form onSubmit={this.props.handleSubmit(this.onSubmit)}>
        <Field label="Name" name="name" type="text" component={this.renderField} />
        <button type="Submit" disabled={this.props.pristine || this.props.submitting}>Create Tshirt</button>
      </form>
    );
  }
}

export default reduxForm({ form: 'newTshirtForm' })(connect(null, { createTshirt })(TshirtNew));
