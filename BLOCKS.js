function process(request) {
var store = require('kvstore');
var console = require('console');
var pubnub = require('pubnub');
var word = request.message.word.toUpperCase();
var outputChannel = request.message.channel;
var guesses = "";
var lives = 0;
var wordResponse = [];
var successCount = 0;
var successGuess = false;
var won = false;
var lost = false;
var startLives = 10;
var startGuesses = "";
try {
var a = store.get("guesses");
return Promise.all([a]).then(function (values) {
console.log(values[0]);
if (request.message.letter == 1) {
guesses = "";
lives = 10;
store.set('guesses', "");
} else {
guesses = values[0];
lives = + request.message.lives;
guesses = guesses + request.message.letter.toUpperCase() + " ";
if (word.indexOf(request.message.letter.toUpperCase()) > -1) {
successGuess = true;
store.set('guesses',guesses);
} else {
lives -= 1;
store.set('guesses',guesses);
}
store.set('guesses',guesses);
}
for (var i = 0; i < word.length; i++) {
if (guesses.indexOf(word[i]) > -1) {
wordResponse[i] = word[i];
successCount++;
} else {
wordResponse[i] = '-';
}
}
lost = lives === 0;
won = successCount === word.length;
if (won || lost) {
lives = startLives;
guesses = startGuesses;
}
var responseMessage = {
"won": won.toString(),
"lost": lost.toString(),
"word": wordResponse.toString().replace(/,/g, " "),
"guesses": guesses.toString(),
"lives": lives.toString(),
"successGuess": successGuess.toString()
};
pubnub.publish({
channel: outputChannel,
message: responseMessage
});
console.log(responseMessage);
return request.ok();
});
} catch (e) {
console.error('Exception:', e);
}
}