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
  var token = document.getElementById('authenticity_token').value
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      var response = this.responseText + "";
      if (response == "good") {
        alert("Successful");
      } else if (response == "bad") {
        alert("Failed");
      } // end if...else response
    } // end if (this.readyState == 4 && this.status == 200)
  } // end xhttp.onreadystatechange = function()
  xhttp.open("POST", "https://dailyjavascript.herokuapp.com/challenges", true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhttp.setRequestHeader("X-CSRF-Token", token)
  xhttp.send("challenge=" + challenge + "&code=" + code + getAssertions() + getPatternType());
} // end function submitChallenge(code)

function disableAssertions() {
  var disabledStatus = false;
  var checkBox = document.getElementById("notChallengeCheckBox");
  var testFunction = document.getElementById("testFunction");
  var assertion1left = document.getElementById("testAssertion1LeftSide");
  var assertion2left = document.getElementById("testAssertion2LeftSide");
  var assertion3left = document.getElementById("testAssertion3LeftSide");

  var assertion1right = document.getElementById("testAssertion1RightSide");
  var assertion2right = document.getElementById("testAssertion2RightSide");
  var assertion3right = document.getElementById("testAssertion3RightSide");

  if (checkBox.checked == true) {
    disabledStatus = true;
  }

  testFunction.disabled = disabledStatus;
  assertion1left.disabled = disabledStatus;
  assertion2left.disabled = disabledStatus;
  assertion3left.disabled = disabledStatus;
  assertion1right.disabled = disabledStatus;
  assertion2right.disabled = disabledStatus;
  assertion3right.disabled = disabledStatus;
} // end function disableAssertions() 

function getAssertions() {
  var values;
  var checkBox = document.getElementById("notChallengeCheckBox");

  if (checkBox.checked == false) {
    var testFunction = document.getElementById("testFunction").value.trim();
    var assertion1left = document.getElementById("testAssertion1LeftSide").value.trim();
    var assertion2left = document.getElementById("testAssertion2LeftSide").value.trim();
    var assertion3left = document.getElementById("testAssertion3LeftSide").value.trim();

    var assertion1right = document.getElementById("testAssertion1RightSide").value.trim();
    var assertion2right = document.getElementById("testAssertion2RightSide").value.trim();
    var assertion3right = document.getElementById("testAssertion3RightSide").value.trim()
    values = "&notChallenge=false&testFunction=" + testFunction + "&assertion1left=" + assertion1left + "&assertion2left=" + assertion2left + "&assertion3left=" + assertion3left + "&assertion1right=" + assertion1right + "&assertion2right=" + assertion2right + "&assertion3right=" + assertion3right;
  } else {
    values = "&notChallenge=true";
  }

  return values;
} // end function getAssertions()

function getPatternType() {
  var patternType = document.getElementById("pattern_type").value.trim();
  return "&pattern_type=" + patternType;
}
