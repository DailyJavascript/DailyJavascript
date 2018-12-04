class InputFields extends React.Component {

	render() {
		return (
			<form>
				<label>
					Destination Name
				</label>
				<input type="text" name="destinationName" id="destinationName" />
				<label>
					Destination URL
				</label>
				<input type="text" name="destinationURL" id="DestinationURL" />
				<label>
					Email
				</label>
				<input type="text" name="email" id="email" />
				<label>
					Email Content
				</label>
				<textarea>
				</textarea>
			</form>
			);
	}
} // end class InputFields


ReactDOM.render(<InputFields />, document.getElementById("root"));