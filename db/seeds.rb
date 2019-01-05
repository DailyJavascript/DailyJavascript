# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
RefCode.create(ref_code:"3e9f5f7de14638431b88", ref_code_url:"?refcode=3e9f5f7de14638431b88", recipient_name:"daily javascript blog", recipient_url:"https://dailyjavascriptblog.netlify.com/")
RefCode.create(ref_code:"f0e0249dbfd0e3570bc3", ref_code_url:"?refcode=f0e0249dbfd0e3570bc3", recipient_name:"medium_strict_mode_post", recipient_url:"https://medium.com/p/e05f3c159d47")
RefCode.create(ref_code:"a06cd09fbcb77a77e44a", ref_code_url:"?refcode=a06cd09fbcb77a77e44a", recipient_name:"daily javascript twitter", recipient_url:"https://twitter.com/DJavascript")
RefCode.create(ref_code:"07db1276000a6629fcf0", ref_code_url:"?refcode=07db1276000a6629fcf0", recipient_name:"welcome_email", recipient_url:"")
RefCode.create(ref_code:"6c05f1aacbab4564f83f", ref_code_url:"?refcode=6c05f1aacbab4564f83f", recipient_name:"challenge_emails", recipient_url:"")
RefCode.create(ref_code:"4e3ca8d61ec6316ccdcb", ref_code_url:"?refcode=4e3ca8d61ec6316ccdcb", recipient_name:"facebook_groups", recipient_url:"")
RefCode.create(ref_code:"87c330adc26654ce70d4", ref_code_url:"?refcode=87c330adc26654ce70d4", recipient_name:"strict_mode_post", recipient_url:"techlondon.slack.com")
RefCode.create(ref_code:"75aeeca2bec8fdf629b6", ref_code_url:"?refcode=75aeeca2bec8fdf629b6", recipient_name:"strict_mode_post", recipient_url:"jrdevjobs.slack.com")
RefCode.create(ref_code:"874df1fa0030acbf6c18", ref_code_url:"?refcode=874df1fa0030acbf6c18", recipient_name:"strict_mode_post", recipient_url:"https://www.freecodecamp.org/forum/")
RefCode.create(ref_code:"2c8dd77e79a4a5c4534d", ref_code_url:"?refcode=2c8dd77e79a4a5c4534d", recipient_name:"strict_mode_post", recipient_url:"learnjs.slack.com")
RefCode.create(ref_code:"56afe4638c26c009f3e4", ref_code_url:"?refcode=56afe4638c26c009f3e4", recipient_name:"strict_mode_post", recipient_url:"https://www.reddit.com/r/javascript/")
RefCode.create(ref_code:"fc42aa9829a396e42fb3", ref_code_url:"?refcode=fc42aa9829a396e42fb3", recipient_name:"strict_mode_post", recipient_url:"discord.speakJS")
RefCode.create(ref_code:"ecf85b5bebb743ceb675", ref_code_url:"?refcode=ecf85b5bebb743ceb675", recipient_name:"upgrade_plan_link", recipient_url:"")
RefCode.create(ref_code:"77a734f4e926bf011148", ref_code_url:"?refcode=77a734f4e926bf011148", recipient_name:"betalist", recipient_url:"")
RefCode.create(ref_code:"5d70b7d685bf0c13fd3e", ref_code_url:"?refcode=5d70b7d685bf0c13fd3e", recipient_name:"mental_prep_post", recipient_url:"jrdevjobs.slack.com")
RefCode.create(ref_code:"6a735966faccd574c777", ref_code_url:"?refcode=6a735966faccd574c777", recipient_name:"mental_prep_post", recipient_url:"https://www.freecodecamp.org/forum/")
RefCode.create(ref_code:"e62898865f383ce6725c", ref_code_url:"?refcode=e62898865f383ce6725c", recipient_name:"mental_prep_post", recipient_url:"codenewbie.slack.com")
RefCode.create(ref_code:"2753a50b6b78997cb516", ref_code_url:"?refcode=2753a50b6b78997cb516", recipient_name:"mental_prep_post", recipient_url:"techlondon.slack.com")
RefCode.create(ref_code:"d82b48ac3736e8c02e37", ref_code_url:"?refcode=d82b48ac3736e8c02e37", recipient_name:"mental_prep_post", recipient_url:"codebuddies.slack.com")
RefCode.create(ref_code:"b56f2eeded32d6fbf8a2", ref_code_url:"?refcode=b56f2eeded32d6fbf8a2", recipient_name:"mental_prep_post", recipient_url:"dctech.slack.com")
RefCode.create(ref_code:"39a53f345408c7a578cd", ref_code_url:"?refcode=39a53f345408c7a578cd", recipient_name:"mental_prep_post", recipient_url:"utahjavascript.slack.com")
RefCode.create(ref_code:"941580124274884c1500", ref_code_url:"?refcode=941580124274884c1500", recipient_name:"mental_prep_post", recipient_url:"torontojs.slack.com")
RefCode.create(ref_code:"555286f9a1030e2b7330", ref_code_url:"?refcode=555286f9a1030e2b7330", recipient_name:"mental_prep_post", recipient_url:"fedm.slack.com")
RefCode.create(ref_code:"ea21cca6ced7477b58d3", ref_code_url:"?refcode=ea21cca6ced7477b58d3", recipient_name:"mental_prep_post", recipient_url:"scotchio.slack.com")
RefCode.create(ref_code:"9c637c53903d19d58941", ref_code_url:"?refcode=9c637c53903d19d58941", recipient_name:"mental_prep_post", recipient_url:"https://www.reddit.com/r/cscareerquestions")
RefCode.create(ref_code:"fae134ac0358711bee09", ref_code_url:"?refcode=fae134ac0358711bee09", recipient_name:"mental_prep_post", recipient_url:"discord.cscareerhackers")
RefCode.create(ref_code:"763fb8c56f80f1e276c3", ref_code_url:"?refcode=763fb8c56f80f1e276c3", recipient_name:"mental_prep_post", recipient_url:"https://www.reddit.com/r/ExperiencedDevs")

Challenge.create(challenge:"This question was recently asked at a FAANG (Facebook, Amazon, Apple, Netflix, or Google) interview:\n\nIn Unix based systems, to get to a directory, a series of directory names, slashes, and single and double dots are used. In this system, a single dot means stay within the nearest parent directory, and is therefore redundant. A double dot means to move up one directory. The following examples illustrate this usage:\n\n\"/root/.\" = \"/root\"\n\n\"/games/football/..\" = \"/games\"\n\n\"/weather/./clouds/../rain\" = \"/weather/rain\"\n\nFor this challenge, create a function called simplifiedDirectory() where the input will be a string containing a route to a directory, and the return value has to be the directory route reduced to it's simplest form.\n")
Challenge.create(challenge:"When you're taking your online or in-person coding challenge, you will be time restricted. Because of this, knowing a few frequently used methods, belonging to particular object types, can be very useful.\n\nSome of these include:\n\nfor strings:  indexOf (which finds the index of a string within a string), substr() (which returns a substring from within a string), and split() (which returns a string split into an array)\n\nfor arrays: sort() (sorts an array), map() (puts each element into a function and stores the return values into a new array), and join() (combines all the elements of an array into a string)\n\nfor numbers: parseInt() (converts a string into an integer if it contains integers), parseFloat() (converts a string into a floating point number if it contains a floating point number), isNan() (used to test if a variable is a number, returns true if variable is NOT a number, and false if variable is a number).\n\nAlthough this list is not exhaustive, the three methods within each type of object are used frequently enough in coding tests, that it is good to become familiar with their use. Please check our blog for an article (or an upcoming article if it does not already exist) on more detail about these methods.")
Challenge.create(challenge:"You are given an integer and you have to return a new integer that is the square of every digit in the original integer. For example:\n\n12 = 14 because 1 squared is 1, and 2 squared is 4.\n\n1361 = 19361 because 1 squared is 1, 3 squared is 9, 6 squared is 36, and 1 squared is 1.\n\nMake a function called makeSquares() that takes an integer as an input, and returns a new integer in which the digits are the squares of the input integer.")
Challenge.create(challenge:"For this challenge, you will be given a string and an integer corresponding to the index of a letter in the string. You must take the letter at that index, double it, and return the new string with the doubled letter.\n\nFor example:\n\n\"water\" and index 2 = \"watter\" because w is at index 0, a is at index 1, and t is at index 2. The t is doubled to tt, and therefore the new string is \"watter\"\n\n\"shipyard\" and index 5 = \"shipyaard\"\n\nYou must create a function called doubleLetter() that takes as input a string and an integer, and returns a new string with the letter at that integer index doubled.")
Challenge.create(challenge:"Given a string, and then given a second string with the letters of the first string re-arranged, determine how many moves it takes to make string one into string two. For the purpose of this challenge, if adjacent letters can be moved together, that can be counted as a single unit being moved, instead of having to move each letter individually. \n\nFor example:\n\noriginal string: \"twitter\", second string: \"ittertw\" - this would take five moves, because the \"t\" and the \"w\" are adjacent and can be moved together.\n\noriginal string: \"twitter\", second string: \"wtittre\" - this would take two moves, first the \"t\" at the beginning would move one position to the right, then the \"e\" would move one position to the right, for a total of two moves.\n\nFor this challenge, you will create a function called countMoves(), which takes two inputs, the first input is the original string, the second input is the re-arranged string, and you must return the total number of moves it took to get from string one to string two. Remember, if adjacent letters can be moved together, they can be counted as a single unit.")
Challenge.create(challenge:"Given a string containing letters without spaces, find within it the longest substring, meaning all characters must be adjacent to each other, that does not have a character repeated and return the length of that substring.\n\nFor example:\n\n\"hooney\" = 4 (\"oney\"), not \"ooney\" because that has a character repeated, the \"o\".\n\n\"aablle\" = 3 (\"abl\" - located in the middle of the string)\n\n\"cccccc\" = 1\n\nTherefore, create a function called noRepeatInSubstring(), that takes as input a string, and returns the length of the longest substring that has no duplicate characters.")
Challenge.create(challenge:"Given two array of numbers in numerical order, combine the two arrays so that the resulting single array is in numerical order. Keep repeated numbers as repeats.\n\nFor example:\n\n[1,3,5] and [2,4,6] = [1,2,3,4,5,6]\n\n[2,3,7,10] and [1,4,9] = [1,2,3,4,7,10]\n\n[1,2] and [2,3,4] = [1,2,2,3,4]\n\nCreate a function called putInOrder() that takes two arrays, each as a separate input, and return the resulting, ordered, single array consisting of the combined numbers.")
Challenge.create(challenge:"Given a string, determine how many re-arrangements of letters you can have without having two duplicate letters next to each other. \n\nFor example:\n\n\"cook\" = \"ocok\", \"koco\", \"okoc\", \"coko\" = 4 re-arrangements. \"kooc\" does not count because two duplicate letters are next to each other.\n\nTherefore, create a function called noDuplicates() that takes as input a string and returns the total number of re-arrangements possible.")
Challenge.create(challenge:"Given two numbers, return the number of times the same number is in the same position in both numbers. For example:\n\n1221 and 2123 = 1 times, because the 2 in the tens place 12(2)1 and 21(2)3, are the same.\n\n14352 and 16335 = 2 times, because the 1 in the ten thousands place and the 3 in the hundreds place are the same among the two numbers. (1)4(3)52 and (1)6(3)35\n\nTherefore, create a function called matchDigits() that takes as input two numbers, and returns an integer that is the number of times the same number is in the same place between the two numbers.")
Challenge.create(challenge:"Given a string and a number, split the string and numbers so that you place the numbers in between the letters. For example:\n\n\"hurry\" and 1234 = \"h1u2r3r4y\"\n\n\"number\" and 345 = \"n3u4m5ber\"\n\n\"cat\" and 345678 = \"c3a4t5678\"\n\nTherefore create a function called inBetween() that takes a string as the first argument and a number as the second argument, and returns a new string with the numbers put in between the letters.")
Challenge.create(challenge:"Given a string and a number, reverse the number and then split the string and numbers so that you place the numbers in between the letters. For example:\n\n\"hurry\" and 1234 = \"h4u3r2r1y\"\n\n\"number\" and 345 = \"n5u4m3ber\"\n\n\"cat\" and 345678 = \"c8a7t6543\"\n\nTherefore create a function called reverseInBetween() that takes a string as the first argument and a number as the second argument, and returns a new string with the numbers reversed and put in between the letters.")
Challenge.create(challenge:"Sometimes when interviewing, you are asked about your understanding of programming concepts, instead of being asked to solve a challenge. One common question is:\n\nWhat is functional programming?\n\nProgrammers who will be interviewing you like to hear the word paradigm used with respect to this question. A paradigm is the principles and rules to how to do something. Functional programming is a programming paradigm, with rules and principles describing the creation of functions.\n\nOne major functional programming rule is that functions should be 'pure.' This means that a function does not change the value of the arguments passed into it and that if the same arguments are passed into it, the same result will always be returned.\n\nFor example:\n\nfunction notPure1(cost,quantity) {\n   cost = 1; // this is not pure because an argument being passed into this function is having it's value assigned or changed\n   return cost * quantity;\n\n}\n\nfunction notPure2(cost,quantity) {\n  return cost*quantity*Math.random(); // not pure because this will return a different answer every time, even if the value of the arguments passed in are the same\n\n}\n\nAnother functional programming principle is that functions should not cause side effects. This means that a function should not mess with or change variables that are not specifically declared within it, i.e. local variables.\n\nExample:\n\nglobalVar = 1;\n\nfunction willCauseSideEffect() {\n\n  var a = 1;\n  var b = 2;\n  globalVar = 3; // this is a side effect because you are changing the value of a non-local variable, which is not allowed in functional programming\n  return a*b;\n}")
Challenge.create(challenge:"Given a string containing a sentence, reverse the letters of each word in the sentence and then revers the sentencce.\n\nFor example:\n\n\"This cat likes milk\" = \"klim sekil tac sihT\"\n\ncreate a function called reverseWordsAndSentence() that takes a sentence string as an argument, and returns a string with the words and sentence reversed.")
Challenge.create(challenge:"When you are on an actual on-site technical interview, disparaging thoughts, fear of failure, and the difficulty of the questions can all coalesce and create a fog of thought that might make the challenging interview more so. A good technique to keep in mind in such moments is that gentle, quiet, deep breaths can help, along with keeping the correct perspective. A blog article that will help you to keep that perspective can be found at https://dailyjavascriptblog.netlify.com/posts/mental-prep-for-technical-interview/?refcode=6c05f1aacbab4564f83f")
Challenge.create(challenge:"Given a string and an array, shift each letter indicated by the first number in the array the number of letters forward indicated by the second number. If a letter gets shifted beyond \"z\" or \"Z\", continue around from the beginning of the alphabet.\n\nYou will be given a combination of upper case and lower case letters, and the resulting letter should be in the same case.\n\nFor example:\n\ngiven the string \"Computer\" and the array [1,3,4,5] = \"Fomtuter\", the first number in the array, 1, refers to the first letter in the string, \"c\" and the second number in the array, 3, indicates how many letters forward it should be shifted: d,e,f <-- 3 letters forward. The next number, 4, refers to the fourth letter in the string, \"p\", and the next number indicates how many letters forward it should be shifted, 5, shifting the letter \"p\" to \"t\".\n\nTherefore create a function called shiftLetters() that takes two arguments, the first is the string to be shifted, and the second is the array of numbers describing the shifts.\n")
Challenge.create(challenge:"Sometimes companies have webpages, often called \"static\" pages, that do not change content or change content very infrequently.  To give users the best site experience with fast load times, these static pages are sometimes hosted on what is known as Content Delivery Networks (CDNs), which are a collection of servers located in different geographic regions.  This makes load times faster because the static website is retrieved from the closest server, geographically, to the user. \n")
Challenge.create(challenge:"The Fibonacci sequence is a numerical sequence in which the next number in the sequence is the addition of the two immediate, previous numbers. It start with 1 and 1 and proceeds from there. It is 1,1,2,3,5,8,13,etc.\n\nIn this challenge you will be given a number indicating the position in the sequence, and you have to return the number at that position.\n\nFor example:\n\ngiven 1, you return 1.\ngiven 2, you return 1.\ngiven 6, you return 8.\n\nCreate a function called fibonacci() that takes as input an integer indicating the position in the sequence, and you must return that number at that position in the Fibonacci sequence.")
Challenge.create(challenge:"In JavaScript, functions written using the function keyword and then having the function name follow immediately, for example: function someName(), are called function declarations and undergo a process known as hoisting. Hoisting is where, during compiling of the program, those functions are moved to the top of the global scope of the program. This is why you can declare and define a function at the end of your JavaScript code, but you can still call it at the beginning of your code, before the point where it's declared and defined.\n\nFunctions declared using the following format: var someName = function() {}, are known as function expressions or function literals or a variable assigned to an anonymous function. Functions generated in this format do not have their definition hoisted and therefore you cannot call them until after the point in the program where they are declared and defined.")
Challenge.create(challenge:"You are given an array of numbers and an integer, and all occurrences of that integer need to be removed from that array, and you must return the length of the new array.\n\nFor example:\n\n[1,2,3,3,4,3,5] and 3 = 4 because after all the 3's are removed from the array, what remains is [1,2,4,5] which has a length of 4\n\nCreate a function called removeNumber() that takes two inputs, the first is the array of numbers and the second is the number to remove and return the length of the array after all instances of that number are removed from the array.\n")
Challenge.create(challenge:"Given an array of integers and a sum, determine if any combination of numbers from the array will add to the sum, and return an array in numerical order containing only those numbers that will add up to the given sum.\n\nFor example:\n\n[1,3,4,11,5,10] and 22 = [1,10,11] because 1   10   11 = 22\n\nCreate a function called findIntegersFromSum(), that takes two inputs. One is the array of numbers, the second is the sum. Return an array containing only those numbers that add up to the sum, in numerical order.")
Challenge.create(challenge:"To implement a singly linked list in JavaScript, create an object with two properties, one named nextNode and one named value, and then create a series of those objects with the next object stored in the nextNode property of the previous node.\n\nFor example:\n\nfirstNode = null;\n\nfunction linkedListNode(val, nn) {\n  this.value = val;\n  this.nextNode = nn;\n}\n\nfunction createLinkedList() {\n firstNode = new linkedListNode(1,null);\n var topNode = firstNode;\n \n for (var i = 2; i < 10; i  ) {\n   topNode.nextNode = new linkedListNode(i,null);\n   topNode = topNode.nextNode;\n }\n\n}\n\n\nThe above function creates a linked list, where the value of each node is an integer from 1 to 10. You can check this by copying and pasting the above code in the console of your web browser, hitting enter, running the createLinkedList() function, and then seeing what firstNode contains. You will see the linked list.")