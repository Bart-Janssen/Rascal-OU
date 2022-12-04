module e8

import IO;
import analysis::graphs::Graph;
import Relation;
import Set;

str A = "A";
str B = "B";
str C = "C";
str D = "D";
str E = "E";
str F = "F";

public Graph[str] graph = 
{
    <A,B>,<A,D>,
    <B,E>,<B,D>,
    <C,B>,<C,E>,<C,F>,
    //D
    <E,D>,<E,F>
    //F   
};

public void example8A()
{
    println("There are <Set::size(carrier(graph))> components");
}

public void example8B()
{
    println("There are <Set::size(graph)> relations");
}

public void example8C()
{
    println("<top(graph)> are not used by any other component");
}

public void example8D()
{
    println("<(graph*)[A]> are needed for A");
}

public void example8E()
{
    println("The directly or indirectly needed for C are <carrier(graph)-((graph*)[C])>");
}

public void example8F()
{
    println("components used by number:");
    println((component:size(invert(graph)[component]) | component <- carrier(graph)));
}