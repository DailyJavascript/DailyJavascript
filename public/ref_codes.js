function getListOfRefCodesFromServer() {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var test = JSON.parse(this.responseText);
			console.log("in getlistofre from server");
			console.log(test);
			return test;
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
		this.state = {list: {name: '', url: '', email: ''}};
		console.log("in constructor");
		console.log(this.state);
	}


	componentDidMount() {
		this.setState({list: getListOfRefCodesFromServer()});
		console.log("in componentDidMount");
		console.log(this.state);
	}


	render() {
		return (
			<div>	
				<p><span>Destination Name: </span><span>{this.state.list.name}</span><span>Email: </span><span>{this.state.list.email}</span></p>
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