using System;

class Program
{
    static void Main()
    {
        Console.WriteLine("Hallo! Wie heißt du?");
        string name = Console.ReadLine();
        Console.WriteLine($"Schön, dich kennenzulernen, {name}!");

        Console.WriteLine("Drücke eine beliebige Taste zum Beenden...");
        Console.ReadKey();
    }
}
