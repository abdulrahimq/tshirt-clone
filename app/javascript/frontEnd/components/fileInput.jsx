import React from 'react';

class FileInput extends React.Component {
  constructor(props) {
    super(props)
    this.onChange = this.onChange.bind(this)
  }

  onChange(event) {
    const { input: { onChange } } = this.props
    onChange(event.target.files[0])
  }

  render() {
    const {input: { value } } = this.props
    const { input, label } = this.props
    return (
      <div>
        <label>{label}</label>
        <div>
          <input
            type='file'
            accept='.png'
            onChange={this.onChange}
            />
        </div>
      </div>
    );
  }
}

export default FileInput
