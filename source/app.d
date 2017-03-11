import std.stdio, std.regex, std.string;

struct Token {
  string type;
  string value;
  ulong line;
  ulong position;
}

void main()
{
  //Alpha-numeric
  auto whitespace = regex(r"^( +)");
  auto number = regex(r"^([0-9]+)");
  auto word = regex(r"^([a-z|A-Z]+)");
  
  //Grouping
  auto langle = regex(r"^\<");
  auto rangle = regex(r"^\>");
  auto lbracket = regex(r"^\[");
  auto rbracket = regex(r"^\]");
  auto lbrace = regex(r"^\{");
  auto rbrace = regex(r"^\}");
  auto lparen = regex(r"^\(");
  auto rparen = regex(r"^\)");
  
  //Punctuation
  auto period = regex(r"^\.");
  auto elipses = regex(r"^...");
  auto comma = regex(r"^,");
  auto question = regex(r"^\?");
  auto exclamation = regex(r"^\!");
  auto colon = regex(r"^\:");
  auto semicolon = regex(r"^;");
  
  //Special
  auto at = regex(r"^\@");
  auto newline = regex(r"^\n");
  
  //Reserved
  auto reserved = regex(r"^(chapter|toc-title)");
  
  //Other
  auto user = regex(r"^");
  auto m = match("1", r"1");

  //Cursor position
  ulong line = 1;
  ulong position = 1;
  ulong skiplength;
  
  //Token
  string lexitem;
  string lexvalue;
  Token[] tokens;
  
  /* Tests
  assert("".match(number));
  assert(" 123".match(number));
  assert("123 abc".match(number));
  */
  
  //TODO. want to be able to call it like document.tab(width)
   void tab(ref string document, ulong newPosition) {
    if (document.length != 0) {
      //increment cursor position counter
      position = position + newPosition;
      
      //Return tail of document
      document = document[newPosition .. $];
    }
  }
  
  void printTokens(Token[] tokens) {
    foreach (token; tokens) writefln("%d:%d\t%s\t%s",token.line, token.position, token.type, token.value);
  }
  
  //Mock input  
  string document = "@chapter 13: The Sleeper Awakens\n @toc-title The Sleeper\nWhy do we sleep? She asked.";
  writeln(document);
  
  while (document.length != 0) {
     /*TODO. the lexicon should be in an associative array and
        use a foreach loop to cycle through the definitions. Then 
        * it's easier to add more definitions, and won't have to
        * add a new "if" statement for each. keep it generic
        
        foreach (definition; lexicon) {
          if (document.match(definition)
           if lexicon.hasKey(definition) {
        }
      */
    if (document.match(whitespace)) {
      m = document.match(whitespace);
      lexitem = "SPACE";
      lexvalue =  m.captures[1];
      skiplength = m.captures[1].length;
    }

    else if (document.match(number)) {
      m = document.match(number);
      lexitem = "NUMBER";
      lexvalue =  m.captures[1];
      skiplength = m.captures[1].length;
    }

    else if (document.match(lbracket)) {
      lexitem = "LBRACKET";
      lexvalue = ""; 
      skiplength = 1;
    }

    else if (document.match(rbracket)) {
      lexitem = "RBRACKET";
      lexvalue = ""; 
      skiplength = 1;
    }
    
    else if (document.match(lbrace)) {
      lexitem = "LBRACE";
      lexvalue = ""; 
      skiplength = 1;
    }

    else if (document.match(rbrace)) {
      lexitem = "RBRACE";
      lexvalue = ""; 
      skiplength = 1;
    }
    
    else if (document.match(lparen)) {
      lexitem = "LPAREN";
      lexvalue = ""; 
      skiplength = 1;
    }

    else if (document.match(rparen)) {
      lexitem = "RPAREN";
      lexvalue = ""; 
      skiplength = 1;
    }
    
    else if (document.match(langle)) {
      lexitem = "LANGLE";
      lexvalue = ""; 
      skiplength = 1;
    }

    else if (document.match(rangle)) {
      lexitem = "RANGLE";
      lexvalue = ""; 
      skiplength = 1;
    }
    
    else if (document.match(question)) {
      lexitem = "QUESTION";
      lexvalue = ""; 
      skiplength = 1;
    }
    
    else if (document.match(exclamation)) {
      lexitem = "EXCLAMATION";
      lexvalue = ""; 
      skiplength = 1;
    }
    
    else if (document.match(period)) {
      lexitem = "PERIOD";
      lexvalue = ""; 
      skiplength = 1;
    }
    
    else if (document.match(colon)) {
      lexitem = "COLON";
      lexvalue = ""; 
      skiplength = 1;
    }
    
    else if (document.match(semicolon)) {
      lexitem = "SEMICOLON";
      lexvalue = ""; 
      skiplength = 1;
    }
    
    else if (document.match(comma)) {
      lexitem = "COMMA";
      lexvalue = ""; 
      skiplength = 1;
    }
    
    else if (document.match(at)) {
      lexitem = "@";
      lexvalue = ""; 
      skiplength = 1;
    }
    
    else if (document.match(newline)) {
      lexitem = "NEWLINE";
      lexvalue = ""; 
      skiplength = 1;
    }

    else if (document.match(reserved)) {
      m = document.match(reserved);
      lexitem = "RESERVED"; 
      lexvalue = m.captures[1]; 
      skiplength = m.captures[1].length;
    }
    
    else if (document.match(word)) {
      m = document.match(word);
      lexitem = "WORD"; 
      lexvalue = m.captures[1]; 
      skiplength = m.captures[1].length;
    }
    else {
      lexitem = "UNKNOWN";
      lexvalue = "null";
    }
    
    tokens = tokens ~ Token(lexitem, lexvalue, line, position);
    
    //If \n, increment line number and reset cursor position.
    if (lexitem == "NEWLINE") { line++; position = 0; }
    
    //le
    tab(document, skiplength);
  }
  printTokens(tokens);
}
