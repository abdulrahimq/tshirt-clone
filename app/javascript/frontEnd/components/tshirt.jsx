import React from 'react';
import tshirt_reducer from '../reducers/tshirt_reducer';

class Tshirt extends React.Component {
  style = {
    background: `url('${this.props.tshirt.photo.url}')`
  }
  render() {

    return (
      <div className="card" style={this.style}>
      <h3>{this.props.tshirt.name}</h3>
      <p>{this.props.tshirt.description}</p>
      </div>
    );
  }
}

export default Tshirt;
