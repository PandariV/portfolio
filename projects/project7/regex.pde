import java.util.*;
String[] fileContents ;
String rawText;
String[] tokens;
ArrayList<Word> cloud = new ArrayList<Word>();
PFont font;

void setup() {
  size(screen.width,screen.height);
  background(0);
  font = createFont("Monospaced", 32);
  fileContents = loadStrings("speech.txt");
  rawText = join(fileContents, " ");
  rawText = rawText.toLowerCase();
  tokens = rawText.split("[^\\w]+");
  //System.out.println(Arrays.toString(tokens));
  
  for(String s : tokens) {
    if (s.equals("") != true) {
      cloud.add(new Word(s));
    }
  }
}

void draw() {
  background(0);
  textFont(font);
  
  for(Word w : cloud) {
    w.update();
    w.show();
  }
}

int countWords(String s) {
  String []split = s.split("\\s");
  return split.length;
}

int countVowels(String s) {
  String [] vowels = s.split("[aeiouyAEIOUY]");
  return vowels.length - 1;
}

int countSyllables(String s) {
  int syllables = s.length() > 2 && s.substring(s.length()-2).equals("e") ? 1 : 0;
  String [] vowels = s.split("[aeiouyAEIOUY]+");
  String [] exceptions = s.split("[a-z][e][\\s]");
  return vowels.length - syllables + exceptions.length;
}

int countSentences(String s) {
  String[] sentences = s.split("[.!?]+");
  return sentences.length;
}

float getFleschScore(String s) {
  return 206.835 - (1.015 * (countWords(s)/countSentences(s))) - (84.6 * (countSyllables(s)/countWords(s)));
}

String getGradeLvl(String s) {
  int score = (int) getFleschScore(s);
  return score < 30 ? "College Grad" : score < 50 ? "College" : score < 60 ? "10 to 12" : score < 70 ? "8 to 9" : score < 80 ? "7" : score < 90 ? "6" : score < 100 ? "5" : "Get Gud"; 
}

class Word {
  String s;
  float x, y, sped;
  int col, size;
  int index;
  String letter;
  float textLength;
  
  Word(String s) {
    this.s = s;
    x = random(width);
    y = random(height);
    sped = countSyllables(s)/2;
    size = 5 * countSyllables(s);
    col = countVowels(s) * 10 + 100;
  }
  
  void show() {
    textSize(size);
    fill(0, col, 0);
    if (s.length() >= 3) {
      String str1 = s.substring(0, index);
      String str2 = s.substring(index + 1);
      text(str1, x, y);
      text(letter, x + textWidth(str1), y);
      text(str2, x + textWidth(str1) + size, y);
      textLength = textWidth(str1) + size + textWidth(str2);
    } else {
      text("大", x, y);
    }
  }
  
  void update() {
    index = (int) random(s.length());
    x =  x > width ? -textLength : x + sped;
    if (s.length() >= 3) {
      String abcs = "手田水口廿卜山戈人心日尸木火土竹十大中水";
      int numero = (int)random(abcs.length()) + 1;
      letter = abcs.substring(numero - 1, numero);
      s = s.substring(0, index) + letter + s.substring(index + 1);
    }
  }
}
