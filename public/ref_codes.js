class InputFields extends React.Component {
	render() {
		return (
			<form>
				<label>
					Destination Name
				</label>
				<input type="text" name="destinationName" id="destinationName" onChange={this.props.handleInput} value={this.props.values.destinationName} />
				<label>
					Destination URL
				</label>
				<input type="text" name="destinationURL" id="DestinationURL" onChange={this.props.handleInput} value={this.props.values.destinationURL} />
				<label>
					Email
				</label>
				<input type="text" name="email" id="email" onChange={this.props.handleInput} value={this.props.values.email} />
				<label>
					Email Content
				</label>
				<textarea>
				</textarea>
			</form>
			);
	}
} // end class InputFields


class RefCodes extends React.Component {
	constructor(props) {
		super(props);
		this.state = { 
			email: '',
			destinationName: '',
			destinationURL: ''
		};
	}

	handleInput = e => {
		const {id,value} = e.target;
		this.setState({
			[id]:value
		});
	}


	render() {
		return <InputFields handleInput={this.handleInput} values={this.state} />;
	}



} // end class RefCodes



ReactDOM.render(<RefCodes />, document.getElementById("root"));