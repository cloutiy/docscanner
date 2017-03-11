import std.stdio, std.regex;

void main()
{
  auto whitespace = regex(r"^( +)");
  auto number = regex(r"^([0-9]+)");
  auto vocabulary = regex(r"^(chapter|toc-title)");
  auto user = regex(r"^");
  auto lbracket = regex(r"^\[");
  auto rbracket = regex(r"^\]");
  auto lbrace = regex(r"^\{");
  auto rbrace = regex(r"^\}");
  auto lparen = regex(r"^\(");
  auto rparen = regex(r"^\)");
  auto newline = regex(r"^\n");
  auto colon = regex(r"^\:");
  auto semicolon = regex(r"^;");
  auto period = regex(r"^\.");
  auto elipses = regex(r"^...");
  auto comma = regex(r"^,");
  auto question = regex(r"^\?");
  auto at = regex(r"^\@");
  auto word = regex(r"^([a-z|A-Z]+)");
  auto m = match("1", r"1");

  /* Tests
  assert("".match(number));
  assert(" 123".match(number));
  assert("123 abc".match(number));
  */
  
  //want to be able to call it like document.tab(width)
  //Function moves cursor up to a new position. This is accomplished by 
  //"chopping" off the head of the document.  like returning the tail of a list.
  void tab(ref string document, ulong newPosition) {
    if (document.length != 0) {
      document = document[newPosition .. $];
      
      //increment cursor position counter
    }
  }
    
  string document = "@chapter 13: The Sleeper Awakens\n @toc-title The Sleeper\nWhy do we sleep? She asked.";
	  while (document.length != 0) {
      //writeln(document);
	    
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
        writefln("WHITESPACE(%d)", m.captures[1].length); 
        tab(document, m.captures[1].length);
        //continue;
      }

      if (document.match(number)) {
        m = document.match(number);
        writefln("NUMBER(%s) of %d chars.", m.captures[1], m.captures[1].length);
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
      
      if (document.match(question)) {
        writeln("QUESTION"); 
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
        writeln("AT"); 
        tab(document, 1);
        //continue;
      }
      
      if (document.match(newline)) {
        writeln("NEWLINE"); 
        tab(document, 1);
        //continue;
      }

      if (document.match(vocabulary)) {
        m = document.match(vocabulary);
        writefln("VOCABULARY(%s) of %d chars.", m.captures[1], m.captures[1].length);
        tab(document, m.captures[1].length);
        //continue;
      }
      
      if (document.match(word)) {
        m = document.match(word);
        writefln("WORD(%s) of %d chars.", m.captures[1], m.captures[1].length);
        tab(document, m.captures[1].length);
        //continue;
      }  
      
      /*
      if (document.match(text)) {
        writeln("TEXT");
      }
      */
      //comment the line below. clean things up
      //if (document.length != 0) document = document[1 .. $];
    }

    /*
       if (glyph.typeIs(BLANK)) {
        
       }
       else if (glyph.TypeIs(DIGIT)) {}
	     else if (glyph.typeIs(LETTER)) {}
       else if ()glyph.typeIs(LPAREN)) {}
	  glyph.typeIs(RPAREN);
    glyph.typeIs(COLON);
    glyph.typeIs(NEWLINE);
    else 
    */
}
