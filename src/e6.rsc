module e6

import IO;

list[str] eu = ["Austria", "Belgium", "Bulgaria", "Czech Republic",
   "Cyprus", "Denmark", "Estonia", "Finland", "France", "Germany",
   "Greece", "Hungary", "Ireland", "Italy", "Latvia", "Lithuania",
   "Luxembourg", "Malta", "The Netherlands", "Poland",
   "Portugal", "Romania", "Slovenia", "Slovakia", "Spain",
   "Sweden", "United Kingdom"];

public void ex6()
{
    println("6a - bevat \'s\'");
    println({a | a <- eu, /s/i := a});

    println("6b - bevat at least 2 e\'s");
    println({a | a <- eu, /e.*e/i := a});

    println("6c - bevat precies 2 e\'s");
    println({a | a <- eu, /^([^e]*e){2}[^e]*$/i := a});

    println("6d - bevat geen n en geen e");
    println({a | a <- eu, /^[^en]*$/i := a});

    println("6e - bevat een letter met ten minste 2 vookomens");
    println({a | a <- eu, /<x:[a-z]>.*<x>/i := a});

    println("6f - eerste a wordt een o");
    println({begin+"o"+eind | a <- eu, /^<begin:[^a]*>a<eind:.*>$/i := a});
}