import std.stdio, std.regex;

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
  
  //Mock input  
  string document = "@chapter 13: The Sleeper Awakens\n @toc-title The Sleeper\nWhy do we sleep? She asked.";
  
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
      writefln("WHITESPACE(%d) at %d, %d", m.captures[1].length, line, position); 
      tab(document, m.captures[1].length);
      //continue;
    }

    if (document.match(number)) {
      m = document.match(number);
      writefln("NUMBER(%s) of %d chars at %d, %d", m.captures[1], m.captures[1].length, line, position);
      tab(document, m.captures[1].length);
      //continue;
    }

    if (document.match(lbracket)) {
      writeln("LBRACKET"); 
      tab(document, 1);
      //continue;
    }

    if (document.match(rbracket)) {
      writeln("RBRACKET"); 
      tab(document, 1);
      //continue;
    }
    
    if (document.match(lbrace)) {
      writeln("LBRACE"); 
      tab(document, 1);
      //continue;
    }

    if (document.match(rbrace)) {
      writeln("RBRACE"); 
      tab(document, 1);
      //continue;
    }
    
    if (document.match(lparen)) {
      writeln("LPAREN"); 
      tab(document, 1);
      //continue;
    }

    if (document.match(rparen)) {
      writeln("RPAREN"); 
      tab(document, 1);
      //continue;
    }
    
    if (document.match(langle)) {
      writeln("LANGLE"); 
      tab(document, 1);
      //continue;
    }

    if (document.match(rangle)) {
      writeln("RANGLE"); 
      tab(document, 1);
      //continue;
    }
    
    if (document.match(question)) {
      writeln("QUESTION"); 
      tab(document, 1);
      //continue;
    }
    
    if (document.match(exclamation)) {
      writeln("EXCLAMATION"); 
      tab(document, 1);
      //continue;
    }
    
    if (document.match(period)) {
      writeln("PERIOD"); 
      tab(document, 1);
      //continue;
    }
    
    if (document.match(colon)) {
      writeln("COLON"); 
      tab(document, 1);
      //continue;
    }
    
    if (document.match(semicolon)) {
      writeln("SEMICOLON"); 
      tab(document, 1);
      //continue;
    }
    
    if (document.match(comma)) {
      writeln("COMMA"); 
      tab(document, 1);
      //continue;
    }
    
    if (document.match(at)) {
      writefln("AT at %d, %d", line, position);
      tab(document, 1);
      //continue;
    }
    
    if (document.match(newline)) {
      writeln("NEWLINE");
      line++; 
      tab(document, 1);
      //continue;
    }

    if (document.match(reserved)) {
      m = document.match(reserved);
      writefln("VOCABULARY(%s) of %d chars at %d, %d", m.captures[1], m.captures[1].length, line, position);
      tab(document, m.captures[1].length);
      //continue;
    }
    
    if (document.match(word)) {
      m = document.match(word);
      writefln("WORD(%s) of %d chars at %d, %d", m.captures[1], m.captures[1].length, line, position);
      tab(document, m.captures[1].length);
      //continue;
    } 
  }
}
