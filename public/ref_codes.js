function getListOfRefCodesFromServer(callback) {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			callback({list: JSON.parse(this.responseText)});
		}
	}
	xhr.open("get","/ref_codes/all",true);
	xhr.send();
} // end function getListOfRefCodesFromServer(callback)


function submitRequest(name, url, email, emailContent, callback) {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			callback({recipientName: '', recipientURL: '', recipientEmail: '', emailContent: '', submitted: true});
			alert(this.responseText);
		}
	} // end xhr.onreadystatechange
	xhr.open("post","/ref_codes",true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded")
	xhr.send("recipientName="+name+"&recipientURL="+url+"&recipientEmail="+email+"&emailContent="+emailContent);
} // end function submitRequest(name,url,email,emailContent)


function RefListing(props) {
	return 	(
			<div>	
				<p><span>Recipient Name: </span><span>{props.listItem.recipientName}</span><span>Ref Code: </span><span>{props.listItem.refCode}</span></p>
				<p><span>Ref Code URL: </span><span>{props.listItem.refCodeURL}</span></p>
				<p><span>Recipient Email: </span><span>{props.listItem.recipientEmail}</span></p>
				<p><span>Recipient URL: </span><span>{props.listItem.recipientURL}</span></p>
				<p><span>Email Content: </span><span>{props.listItem.emailContent}</span></p>
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
				<textarea name="emailContent" id="emailContent" onChange={this.props.handleInput} value={this.props.values.emailContent}>
				</textarea>
				<button onClick={this.props.handleAdd}>Add</button>
			</div>
			);
	}
} // end class InputFields


class ListOfRefCodes extends React.Component {
	constructor(props) {
		super(props);
		this.state = {list: []};
		this.setState = this.setState.bind(this);
	}


	componentDidMount() {
		getListOfRefCodesFromServer(this.setState);
	}

	componentDidUpdate() {
		if (this.props.newSubmission) getListOfRefCodesFromServer(this.setState);
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
			recipientName: '',
			recipientURL: '',
			recipientEmail: '',
			emailContent: '',
			submitted: false
		};
		this.setState = this.setState.bind(this);
	}


	handleInput = (e) => {
		const {target : {id, value}} = e;
		this.setState({
			[id]: value,
			submitted: false
		});
	}

	handleAdd = (e) => {
		var cont = true;
		if ((this.state.recipientEmail.trim() != "") && (this.state.emailContent.trim() == "")) {
			cont = confirm("Email is filled out but email content is blank. Are you sure you want to submit as is?");
		}
		if (cont) submitRequest(this.state.recipientName, this.state.recipientURL, this.state.recipientEmail, this.state.emailContent, this.setState);
	}


	render() {
		return (
			<div>
				<InputFields handleInput={this.handleInput} handleAdd={this.handleAdd} values={this.state} />
				<hr />
				<ListOfRefCodes newSubmission={this.state.submitted}/>
			</div>
		);
	}
} // end class RefCodes


ReactDOM.render(<RefCodes />, document.getElementById("root"));