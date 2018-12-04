function getListOfRefCodesFromServer() {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			console.log(this.responseText);
			console.log(typeof this.responseText);
			return [this.responseText];
		}
	}
	xhr.open("get","/ref_codes/all",true);
	xhr.send();
}


class InputFields extends React.Component {
	render() {
		return (
			<div>
				<label>
					Destination Name
				</label>
				<input type="text" name="destinationName" id="destinationName" onChange={this.props.handleInput} value={this.props.values.destinationName} />
				<label>
					Destination URL
				</label>
				<input type="text" name="destinationURL" id="destinationURL" onChange={this.props.handleInput} value={this.props.values.destinationURL} />
				<label>
					Email
				</label>
				<input type="text" name="email" id="email" onChange={this.props.handleInput} value={this.props.values.email} />
				<label>
					Email Content
				</label>
				<textarea>
				</textarea>
				<button>Add</button>
			</div>
			);
	}
} // end class InputFields


class ListOfRefCodes extends React.Component {
	constructor(props) {
		super(props);
		this.state = {list: []};
	}


	componentDidMount() {
		this.list = getListOfRefCodesFromServer();
		this.setState({list: this.list});
	}


	render() {
		return (
			<div>	
				<p><span>Destination Name: </span><span></span><span>Email: </span><span></span></p>
				<p><span>Destination URL: </span><span></span></p>
				<p><span>Email Content: </span></p>
				<p></p>
			</div>
		);
	}


} // end class ListOfRefCodes

class RefCodes extends React.Component {
	constructor(props) {
		super(props);
		this.state = { 
			email: '',
			destinationName: '',
			destinationURL: '',
			change: ''
		};
	}

	handleInput = (e) => {
		const {target : {id, value}} = e;
		this.setState({
			[id]:value,
			change:value
		});
	}


	render() {
		return (
			<div>
				<InputFields handleInput={this.handleInput} values={this.state} />
				<hr />
				<input type="text" value={this.state.change} />
				<ListOfRefCodes />
			</div>
		);
	}



} // end class RefCodes



ReactDOM.render(<RefCodes />, document.getElementById("root"));