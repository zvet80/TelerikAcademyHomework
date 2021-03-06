﻿namespace _07.FindOccurrences
{
    /*7.Write a program that finds in given array of integers (all belonging to the range [0..1000]) how many times each of them occurs.
        Example: array = {3, 4, 4, 2, 3, 3, 4, 3, 2}
        2 → 2 times
        3 → 4 times
        4 → 3 times*/

    using System;
    using System.Collections.Generic;
    using System.Linq;

    class FindOccurrences
    {
        static void Main()
        {
            List<int> list = new List<int>() { 1, 1, 5, 5, 6, 7, 8, 1, -9, 5, 5, 6, 7 };
            FindNumOccurrences(list);
        }

        public static void FindNumOccurrences(List<int> list)
        {
            Dictionary<int, int> occurrences = list.GroupBy(x => x).ToDictionary(g => g.Key, g => g.Count());

            foreach (var item in occurrences)
            {
                Console.WriteLine("{0} -> {1} times", item.Key, item.Value);
            }
        }
    }
}
