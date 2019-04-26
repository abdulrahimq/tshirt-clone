import React from 'react';
import { Link } from 'react-router-dom';

class Tshirt extends React.Component {

  render() {

    return (
      <Link to={`/tshirt/${this.props.tshirt.id}`}>
        <div className="card" >
          <div className="card-image">
            <img src={this.props.tshirt.photo.url} />
          </div>
          <div className="card-content">
            <h3>{this.props.tshirt.name}</h3>
            <p>{this.props.tshirt.description}</p>
          </div>
        </div>
      </Link>
    );
  }
}

export default Tshirt;
