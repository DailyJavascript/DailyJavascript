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
			getListOfRefCodesFromServer(callback);
		}
	} // end xhr.onreadystatechange
	xhr.open("post","/ref_codes",true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded")
	xhr.send("recipientName="+name.trim()+"&recipientURL="+url.trim()+"&recipientEmail="+email.trim()+"&emailContent="+emailContent.trim());
} // end function submitRequest(name,url,email,emailContent)


class RefListing extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			style: {}
		};
		this.myRef = React.createRef();
	}
	
	componentDidMount() {
		this.myRef.current.offsetHeight;
		{/* ReactDOM.findDOMNode(this).offsetHeight; */}
		this.setState({style: {marginLeft: 0, backgroundColor: "white"} });
	}

	render() {
		const a = (<div><p><span>Recipient Name: </span><span>{this.props.listItem.recipientName}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>Ref Code: </span><span>{this.props.listItem.refCode}</span></p>
				<p><span>Ref Code URL: </span><span>{this.props.listItem.refCodeURL}</span></p>
				<p><span>Recipient URL: </span><span>{this.props.listItem.recipientURL}</span></p>
				<p><span>Recipient Email: </span><span>{this.props.listItem.recipientEmail}</span></p>
				<p><span>Email Content: </span><span>{this.props.listItem.emailContent}</span></p>
				<p></p></div>);
		const b = (<div><br /><span>****</span></div>);
		if (this.props.lastItem) 
			return (<div ref={this.myRef} className="listing" style={this.state.style}>{a}</div>);
		else
			return (<div ref={this.myRef} className="listing" style={this.state.style}>{a}{b}</div>);	
	}
}// end function RefListing(props)


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
	}

	render() {
		const listItems = this.props.list.map((listItem, index) => {if (index == this.props.list.length-1) return <RefListing key={listItem.refCode} listItem={listItem} lastItem={true}/>; else return <RefListing key={listItem.refCode} listItem={listItem} lastItem={false}/>;});
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
			list: [],
			submitted: false
		};
		this.setState = this.setState.bind(this);
		this.intervalID = null;
	}

	componentDidMount() {
		getListOfRefCodesFromServer(this.setState);
		this.intervalID = setInterval(() => getListOfRefCodesFromServer(this.setState), 1500);
	}

	componentWillUnmount() {
		clearInterval(this.intervalID);
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
				<ListOfRefCodes list={this.state.list}/>
			</div>
		);
	}
} // end class RefCodes


ReactDOM.render(<RefCodes />, document.getElementById("root"));