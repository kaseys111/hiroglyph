const ReactDOM = require('react-dom');
const EmojiPicker = require('emojione-picker');

function onEmojiPickerChange(data) {
  // The emojione-picker library gives you an object 'data'
  // which has some fields in it.
  //
  // data.unicode is a hex string like "1f60e".
  //
  // Number.parseInt(data.unicode, 16) takes that string
  // and reads it as a base-16 number (hexadecimal)
  //
  // String.fromCodePoint() converts that number to a string.
  const emoji = String.fromCodePoint(Number.parseInt(data.unicode, 16));
  console.log('Adding emoji', emoji);
  // This gets the input element and then adds the emoji to the string.
  document.getElementById('emoji-input').value += emoji;
}

function kaseyIsGreat() {
  ReactDOM.render(
    React.createElement(EmojiPicker, {
      onChange: onEmojiPickerChange,
    }, null),
    document.getElementById('root')
  );
}
window.kaseyIsGreat = kaseyIsGreat;
