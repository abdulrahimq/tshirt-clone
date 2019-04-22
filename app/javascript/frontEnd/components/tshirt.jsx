import React from 'react';
import tshirt_reducer from '../reducers/tshirt_reducer';

class Tshirt extends React.Component {
  render() {
    const { tshirt } = this.props;
    const overlay = tshirt.photo.url.slice(61, -4);
    const imgWhite = `https://res.cloudinary.com/dju9xcsec/image/upload/l_${overlay},h_300,w_300/v1553144623/White.jpg`;
    const imgBlack = `https://res.cloudinary.com/dju9xcsec/image/upload/l_${overlay},w_300,h_300/v1553144618/Black.jpg`;
    return (
      // <div className="card">
      //   <div className="img-container">
      //     <div className="img-white img-tshirt" style={{ backgroundImage: `url('${imgWhite}')` }}></div>
      //     <div className="img-black img-tshirt" style={{ backgroundImage: `url('${imgBlack}')`}}></div>
      //   </div>
      //   <div className="card-details">
      //     {/* <h1><%= link_to tshirt.name, tshirt_path(tshirt) %></h1> */}
      //     <h1>{tshirt.price}</h1>
      //   </div>
      // </div>
      <h1>Fuck You</h1>
    );
  }
}

export default Tshirt;
