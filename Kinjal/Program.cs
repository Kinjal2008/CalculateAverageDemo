using System.Text.RegularExpressions;

namespace Kinjal
{
    class CalculateAverage
    {
        static void Main()
        {
            var numbers = new List<decimal>();

            Console.WriteLine("Please Enter your number between (4,5,6,7,8,9).\n (Enter 'Done' to quit):");
            while (true)
            {
                var input = Console.ReadLine();
                if (string.IsNullOrEmpty(input)) continue;
                //var regex = new Regex(@"[^a-zA-Z0-9\s]");
                //TODO : Implement regex to validate against special characters.
                if (input.ToLower() == "done")
                {
                    Console.WriteLine("\n");
                    Console.WriteLine("Total number is:" + numbers.Count);
                    Console.WriteLine("Total is:" + numbers.Sum());
                    Console.WriteLine("Average is:" + numbers.Average().ToString("##.##"));
                    Console.ReadLine();
                    break;
                }

                if (decimal.TryParse(input, out var number))
                {
                    if (number is >= 4 and <= 9)
                    {
                        numbers.Add(number);
                    }
                    else
                    {
                        Console.WriteLine("\n Not in range.! ");
                    }
                }
                else
                {
                    Console.WriteLine("\nInvalid entry! ");
                }

            }
        }
    }
}