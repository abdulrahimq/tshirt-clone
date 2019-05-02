import React from 'react';
import { Link } from 'react-router-dom';

class Tshirt extends React.Component {

  render() {
    console.log(this.props.tshirt.photo)
    return (
      // <Link to={`/tshirt/${this.props.tshirt.id}`}>
      <a href={`/tshirts/${this.props.tshirt.id}`}>
        <div className="card" >
          <div className="card-image">
            <img src={this.props.tshirt.photo} />
          </div>
          <div className="card-content">
            <h3>{this.props.tshirt.name}</h3>
            <p>{this.props.tshirt.description}</p>
          </div>
        </div>
      </a>

      // </Link>
    );
  }
}

export default Tshirt;
