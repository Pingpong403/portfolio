class KeyboardHelper {
  public KeyboardHelper() {}
  
  public String charToStr(char c) {
    // Only allow letters
    switch (c) {
      case 'a':
        return "a";
      case 'b':
        return "b";
      case 'c':
        return "c";
      case 'd':
        return "d";
      case 'e':
        return "e";
      case 'f':
        return "f";
      case 'g':
        return "g";
      case 'h':
        return "h";
      case 'i':
        return "i";
      case 'j':
        return "j";
      case 'k':
        return "k";
      case 'l':
        return "l";
      case 'm':
        return "m";
      case 'n':
        return "n";
      case 'o':
        return "o";
      case 'p':
        return "p";
      case 'q':
        return "q";
      case 'r':
        return "r";
      case 's':
        return "s";
      case 't':
        return "t";
      case 'u':
        return "u";
      case 'v':
        return "v";
      case 'w':
        return "w";
      case 'x':
        return "x";
      case 'y':
        return "y";
      case 'z':
        return "z";
      case 'A':
        return "A";
      case 'B':
        return "B";
      case 'C':
        return "C";
      case 'D':
        return "D";
      case 'E':
        return "E";
      case 'F':
        return "F";
      case 'G':
        return "G";
      case 'H':
        return "H";
      case 'I':
        return "I";
      case 'J':
        return "J";
      case 'K':
        return "K";
      case 'L':
        return "L";
      case 'M':
        return "M";
      case 'N':
        return "N";
      case 'O':
        return "O";
      case 'P':
        return "P";
      case 'Q':
        return "Q";
      case 'R':
        return "R";
      case 'S':
        return "S";
      case 'T':
        return "T";
      case 'U':
        return "U";
      case 'V':
        return "V";
      case 'W':
        return "W";
      case 'X':
        return "X";
      case 'Y':
        return "Y";
      case 'Z':
        return "Z";
      case ' ':
        return " ";
       default:
         return "";
    }
  }
  
  public String charToStr(char c, boolean allowNumbers) {
    switch (c) {
      case 'a':
        return "a";
      case 'b':
        return "b";
      case 'c':
        return "c";
      case 'd':
        return "d";
      case 'e':
        return "e";
      case 'f':
        return "f";
      case 'g':
        return "g";
      case 'h':
        return "h";
      case 'i':
        return "i";
      case 'j':
        return "j";
      case 'k':
        return "k";
      case 'l':
        return "l";
      case 'm':
        return "m";
      case 'n':
        return "n";
      case 'o':
        return "o";
      case 'p':
        return "p";
      case 'q':
        return "q";
      case 'r':
        return "r";
      case 's':
        return "s";
      case 't':
        return "t";
      case 'u':
        return "u";
      case 'v':
        return "v";
      case 'w':
        return "w";
      case 'x':
        return "x";
      case 'y':
        return "y";
      case 'z':
        return "z";
      case 'A':
        return "A";
      case 'B':
        return "B";
      case 'C':
        return "C";
      case 'D':
        return "D";
      case 'E':
        return "E";
      case 'F':
        return "F";
      case 'G':
        return "G";
      case 'H':
        return "H";
      case 'I':
        return "I";
      case 'J':
        return "J";
      case 'K':
        return "K";
      case 'L':
        return "L";
      case 'M':
        return "M";
      case 'N':
        return "N";
      case 'O':
        return "O";
      case 'P':
        return "P";
      case 'Q':
        return "Q";
      case 'R':
        return "R";
      case 'S':
        return "S";
      case 'T':
        return "T";
      case 'U':
        return "U";
      case 'V':
        return "V";
      case 'W':
        return "W";
      case 'X':
        return "X";
      case 'Y':
        return "Y";
      case 'Z':
        return "Z";
      case ' ':
        return " ";
       default:
         if (allowNumbers) {
           return (getNumber(c, false));
         }
         return "";
    }
  }
  
  public String charToStr(char c, boolean allowNumbers, boolean allowSymbols) {
    switch (c) {
      case 'a':
        return "a";
      case 'b':
        return "b";
      case 'c':
        return "c";
      case 'd':
        return "d";
      case 'e':
        return "e";
      case 'f':
        return "f";
      case 'g':
        return "g";
      case 'h':
        return "h";
      case 'i':
        return "i";
      case 'j':
        return "j";
      case 'k':
        return "k";
      case 'l':
        return "l";
      case 'm':
        return "m";
      case 'n':
        return "n";
      case 'o':
        return "o";
      case 'p':
        return "p";
      case 'q':
        return "q";
      case 'r':
        return "r";
      case 's':
        return "s";
      case 't':
        return "t";
      case 'u':
        return "u";
      case 'v':
        return "v";
      case 'w':
        return "w";
      case 'x':
        return "x";
      case 'y':
        return "y";
      case 'z':
        return "z";
      case 'A':
        return "A";
      case 'B':
        return "B";
      case 'C':
        return "C";
      case 'D':
        return "D";
      case 'E':
        return "E";
      case 'F':
        return "F";
      case 'G':
        return "G";
      case 'H':
        return "H";
      case 'I':
        return "I";
      case 'J':
        return "J";
      case 'K':
        return "K";
      case 'L':
        return "L";
      case 'M':
        return "M";
      case 'N':
        return "N";
      case 'O':
        return "O";
      case 'P':
        return "P";
      case 'Q':
        return "Q";
      case 'R':
        return "R";
      case 'S':
        return "S";
      case 'T':
        return "T";
      case 'U':
        return "U";
      case 'V':
        return "V";
      case 'W':
        return "W";
      case 'X':
        return "X";
      case 'Y':
        return "Y";
      case 'Z':
        return "Z";
      case ' ':
        return " ";
       default:
         if (allowNumbers) {
           return (getNumber(c, allowSymbols));
         }
         return "";
    }
  }
  
  private String getNumber(char c, boolean allowSymbols) {
    switch (c) {
      case '1':
        return "1";
      case '2':
        return "2";
      case '3':
        return "3";
      case '4':
        return "4";
      case '5':
        return "5";
      case '6':
        return "6";
      case '7':
        return "7";
      case '8':
        return "8";
      case '9':
        return "9";
      case '0':
        return "0";
      default:
        if (allowSymbols) {
          return getSymbol(c);
        }
        return "";
    }
  }
  
  private String getSymbol(char c) {
    switch (c) {
      case '!':
        return "!";
      case '@':
        return "@";
      case '#':
        return "#";
      case '$':
        return "$";
      case '%':
        return "%";
      case '^':
        return "^";
      case '&':
        return "&";
      case '*':
        return "*";
      case '(':
        return "(";
      case ')':
        return ")";
      case '-':
        return "-";
      case '_':
        return "_";
      case '=':
        return "=";
      case '+':
        return "+";
      case '`':
        return "`";
      case '~':
        return "~";
      case '[':
        return "[";
      case '{':
        return "{";
      case ']':
        return "]";
      case '}':
        return "}";
      case ';':
        return ";";
      case ':':
        return ":";
      case '\'':
        return "'";
      case '"':
        return "\"";
      case '|':
        return "|";
      case ',':
        return ",";
      case '<':
        return "<";
      case '.':
        return ".";
      case '>':
        return ">";
      case '/':
        return "/";
      case '?':
        return "?";
      case '\\':
        return "\\";
      default:
        return "";
    }
  }
}
