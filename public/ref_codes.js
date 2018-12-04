class InputFields extends React.Component {
	constructor(props) {
		super(props);
		this.state = {};
	}


	render() {
		return (
			<h1>Destination Url</h1>
			<input type="text" name="destinationUrl" id="destinationUrl" />
			);
	}
} // end class InputFields


ReactDOM.render(<InputFields />, document.getElementById("root"));