fileContents = [];
var rawText;
tokens = [];
cloud = [];
var font;

function preload() {
  font = loadFont("font.ttf");
  fileContents = loadStrings("text.txt");
  rawText = join(fileContents, "\s");
  console.log(rawText);
  rawText = rawText.toLowerCase();
  tokens = rawText.split("[^\w]+");
}

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(0);
  
  for(var s of tokens) {
    if (s != null) {
      cloud.push(new Word(s));
    }
  }
}

function draw() {
  background(0);
  textFont(font);
  
  for(var w of cloud) {
    w.update();
    w.show();
  }
}

function countWords(s) {
  var split = s.split("\\s");
  return split.length;
}

function countVowels(s) {
  var vowels = s.split("[aeiouyAEIOUY]");
  return vowels.length - 1;
}

function countSyllables(s) {
  var syllables = s.length > 2 && s.substring(s.length-2) == e ? 1 : 0;
  var vowels = s.split("[aeiouyAEIOUY]+");
  var exceptions = s.split("[a-z][e][\\s]");
  return vowels.length - syllables + exceptions.length;
}

function countSentences(s) {
  var sentences = s.split("[.!?]+");
  return sentences.length;
}

function getFleschScore(s) {
  return 206.835 - (1.015 * (countWords(s)/countSentences(s))) - (84.6 * (countSyllables(s)/countWords(s)));
}

function getGradeLvl(s) {
  var score = parseInt(getFleschScore(s));
  return score < 30 ? "College Grad" : score < 50 ? "College" : score < 60 ? "10 to 12" : score < 70 ? "8 to 9" : score < 80 ? "7" : score < 90 ? "6" : score < 100 ? "5" : "Get Gud"; 
}

class Word {  
  constructor(s) {
    this.s = s;
    this.x = random(width);
    this.y = random(height);
    this.sped = countSyllables(s);
    this.size = 12 * countSyllables(s);
    this.col = countVowels(s) * 10 + 100;
    this.index = 0;
  }
  
  show() {
    textSize(this.size);
    fill(0, this.col, 0);
    if (this.s.length >= 3) {
      var str1 = this.s.substring(0, this.index);
      var str2 = this.s.substring(this.index + 1);
      text(str1, this.x, this.y);
      text(this.letter, this.x + textWidth(str1), this.y);
      text(str2, this.x + textWidth(str1) + this.size, this.y);
      this.textLength = textWidth(str1) + this.size + textWidth(str2);
    } else {
      text("大", this.x, this.y);
    }
  }
  
  update() {
    this.index = parseInt(random(this.s.length));
    this.x =  this.x > width ? -this.textLength : this.x + this.sped;
    if (this.s.length >= 3) {
      var abcs = "手田水口廿卜山戈人心日尸木火土竹十大中水";
      var numero = parseInt(random(abcs.length) + 1);
      this.letter = abcs.substring(numero - 1, numero);
      this.s = this.s.substring(0, this.index) + this.letter + this.s.substring(this.index + 1);
    }
  }
}
