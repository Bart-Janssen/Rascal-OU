module e7

import IO;
import List;

int limit = 101;

public rel[int,list[int]] example7A()
{
    rel[int,list[int]] l = {};
    for (i <- [1..limit])
    {
        l+=<i,[n | n <- [1..limit], i%n == 0]>;
    }
    return l;
}

public void example7B()
{
    rel[int,int] l = {};
    int highest = 0;
    for (i <- example7A())
    {
        if (size(i[1]) >= highest)
        {
            if (!(size(i[1]) == highest)) l = {};
            highest = size(i[1]);
            l+={<i[0],size(i[1])>};
        }
    }
    for (i <- l)
    {
        println("<i[0]> -\> <i[1]>");
    }
}

public rel[int,int] example7C()
{
    rel[int,int] l = {};
    for (i <- [1..limit])
    {
        l+={<i,k> | k <- <i,size([n | n <- [1..limit], i%n == 0])>, k == 2};
    }
    return l;
}