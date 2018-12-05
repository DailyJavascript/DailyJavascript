function getListOfRefCodesFromServer(callback) {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var test = JSON.parse(this.responseText);
			console.log("in getlistofre from server");
			console.log(test);
			callback({list: test});
		}
	}
	xhr.open("get","/ref_codes/all",true);
	xhr.send();
}


function RefListing(props) {
	return 	(
			<div>	
				<p><span>Recipient Name: </span><span>{props.listItem.recipientName}</span><span>Recipient Email: </span><span>{props.listItem.recipientEmail}</span></p>
				<p><span>Recipient URL: </span><span>{props.listItem.recipientURL}</span></p>
				<p><span>Email Content: </span></p>
				<p></p>
			</div>
			);
} // end function RefListing(props)

class InputFields extends React.Component {
	render() {
		return (
			<div>
				<label>
					Recipient Name
				</label>
				<input type="text" name="recipientName" id="recipientName" onChange={this.props.handleInput} value={this.props.values.recipientName} />
				<label>
					Recipient URL
				</label>
				<input type="text" name="recipientURL" id="recipientURL" onChange={this.props.handleInput} value={this.props.values.recipientURL} />
				<label>
					Recipient Email
				</label>
				<input type="text" name="recipientEmail" id="recipientEmail" onChange={this.props.handleInput} value={this.props.values.recipientEmail} />
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
		console.log("in constructor");
		console.log(this.state);
		this.setState = this.setState.bind(this);
	}

	componentDidMount() {
		getListOfRefCodesFromServer(this.setState);
		console.log("in componentDidMount");
		console.log(this.state);
	}

	render() {
		const listItems = this.state.list.map((listItem) => <RefListing key={listItem.recipientURL} listItem={listItem}/>);
		if (!listItems || listItems.length == 0)
			return (<div>No List Items Yet</div>);
		else 
			return (<div>{listItems}</div>);
	}


} // end class ListOfRefCodes

class RefCodes extends React.Component {
	constructor(props) {
		super(props);
		this.state = { 
			recipientEmail: '',
			recipientName: '',
			recipientURL: '',
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
				<ListOfRefCodes />
			</div>
		);
	}



} // end class RefCodes



ReactDOM.render(<RefCodes />, document.getElementById("root"));