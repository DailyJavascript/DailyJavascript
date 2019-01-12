// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .


function submitChallenge(code) {
  var challenge = document.getElementById("challengeText").value;
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        var response = this.responseText + "";
        if (response == "good") {
          alert("Successful");
        } else if (response == "bad") {
          alert("Failed");
        } // end if...else response
    } // end if (this.readyState == 4 && this.status == 200)
  } // end xhttp.onreadystatechange = function()
  xhttp.open("POST","https://dailyjavascript.herokuapp.com/challenges",true);
  xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
  xhttp.send("challenge="+challenge+"&code="+code);
} // end function submitChallenge(code)

function disableAssertions() {
  var checkBox = document.getElementById("notChallengeCheckBox");
  var testFunction = document.getElementById("testFunction");
  var assertion1left = document.getElementById("testAssertion1LeftSide");
  var assertion2left = document.getElementById("testAssertion2LeftSide");
  var assertion3left = document.getElementById("testAssertion3LeftSide");

  var assertion1right = document.getElementById("testAssertion1RightSide");
  var assertion2right = document.getElementById("testAssertion2RightSide");
  var assertion3right = document.getElementById("testAssertion3RightSide");

  if (checkBox.checked == true) {
    testFunction.disabled = true;
    assertion1left.disabled = true;
    assertion2left.disabled = true;
    assertion3left.disabled = true;
    assertion1right.disabled = true;
    assertion2right.disabled = true;
    assertion3right.disabled = true;
  } else {
    testFunction.disabled = false;
    assertion1left.disabled = false;
    assertion2left.disabled = false;
    assertion3left.disabled = false;
    assertion1right.disabled = false;
    assertion2right.disabled = false;
    assertion3right.disabled = false;
  }
} // end function disableAssertions() 