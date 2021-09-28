using OnlineRegisterClassLibrary;
using System;
using System.Data.SqlClient;

namespace OnlineRegisterConsole
{
    class Program
    {
        static DbTools db = new DbTools();
        static void Main(string[] args)
        {
            
            Console.Title = "Online Register";
            char choice = ' ';
            do
            {
                Console.WriteLine("\n*** ONLINE REGISTER BY VALLAURI ***\n");
                Console.WriteLine("1 - Initialize Student");
                Console.WriteLine("2 - Classes List");
                Console.WriteLine("3 -");
                Console.WriteLine("4 - ");
                Console.WriteLine("5 - View Data");
                Console.WriteLine("---------------");
                Console.WriteLine("B - Backup Data");
                Console.WriteLine("T - Restore Data");
                Console.WriteLine("R - Reset Data");
                Console.WriteLine("---------------");
                Console.WriteLine("X - EXIT\n");
                choice = Console.ReadKey(true).KeyChar;

                switch (choice)
                {
                    case '1':
                        //Console.WriteLine("Call student list");
                        InitializeStudent();
                        break;
                    case '2':
                        Console.WriteLine("Call class list");
                        break;
                    case '5':
                        ViewData();
                        break;

                    default:
                        Console.WriteLine("Work in progress...");
                        break;
                }
            } while (choice != 'X' && choice!= 'x');
        }

        private static void InitializeStudent()
        {
            throw new NotImplementedException();
        }

        public static void ViewData()
        {
            Console.Write("\n*** STUDENTS ***\n");
            Console.Write(db.GetTableList("Student"));
            Console.Write("\n---------------\n");
        }
    }
}
