module e9

import IO;
import util::Resources;
import Set;
import List;
import analysis::graphs::Graph;
import Relation;

import lang::java::jdt::m3::Core;
import lang::java::m3::AST;

Resource jabber = getProject(|project://JabberPoint/|);
M3 model = createM3FromEclipseProject(|project://JabberPoint/|);
set[Declaration] windowHandler = createAstsFromFiles({|project://JabberPoint/src/main/jabberpoint/userinterface/handlers/SwingSlideHandler.java|}, false);

public set[loc] getJavaFiles()
{
   return {a | /file(a) <- jabber, a.extension == "java"};
}

public void example9A()
{
	println(Set::size(getJavaFiles()));
}

public bool aflopend(tuple[loc, num] x, tuple[loc, num] y)
{
   return x[1] > y[1];
} 

public void example9B()
{
	rel[loc, int] lines = {<f,List::size(readFileLines(f))> | f <- getJavaFiles()};
	
	for (<f,l> <- sort(toList(lines), aflopend))
	{
		println("<f.file> = <l> lines");
	}
}

public void extends()
{
	for (<a,b> <- model.extends)
		println("<a> extends <b>");
}

public void loops()
{
	int numLoops = 0;
	visit (windowHandler)
	{
		case \for(_,_,_):numLoops+=1;
		case \for(_,_,_,_):numLoops+=1;
		case \foreach(_,_,_):numLoops+=1;
	}
	println("<numLoops>");
}



public void example9C()
{
	rel[loc,loc] methods = {<x,y> | <x,y> <- model.containment, x.scheme=="java+class", y.scheme=="java+method" || y.scheme=="java+constructor"};
	rel[loc,int] count = {<a,size(methods[a])> | a <- domain(methods)};
	for (<a,l> <- sort(count, aflopend))
	{
		println("<a.file> <l>");
	}
}

public void example9D()
{
	rel[loc,loc] inverts = invert(model.extends);
	childs = {<a, size((inverts+)[a])> | a <- domain(inverts)};
	for (<a, n> <- sort(childs, aflopend))
	{
    	println("<a.file>: <n> childs");
  	}
}

public void example9E()
{
    set[Declaration] declarations = createAstsFromFiles(getJavaFiles(), false);
    lrel[str, Statement] result = [];
    visit (declarations)
    {
       case \method(_, name, _, _, impl): result += <name, impl>;
       case \constructor(name, _, _, impl): result += <name, impl>;
    }
    rel[str,int] final = {};
    int highest = 0;
    for (<n,s> <- result)
    {
    	int count = 0;
	    visit(s)
	    {
	    	case \if(_,_): count+=1;
	    	case \if(_,_,_): count+=1;
	    }
	    if (count > highest)
	    {
	    	highest = count;
	    	final = {};
	    	final+=<n,highest>;
	    }
    }
    println("<toList(final)[0][0]> has <toList(final)[0][1]> if\'s");
}


