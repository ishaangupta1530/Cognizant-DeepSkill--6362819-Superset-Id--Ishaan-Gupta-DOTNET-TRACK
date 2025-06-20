using System;

public class Loger
{
    private static Loger login;

    private Loger()
    {
        Console.WriteLine("Instance Created:");
    }

    public static Loger GetInstance()
    {
        if (login == null)
        {
            login = new Loger();
        }
        return login;
    }

    public void Log(string message)
    {
        Console.WriteLine("LoggedIn: " + message);
    }
}

public class LogerTest
{
    public static void Main(string[] args)
    {
        Loger l1 = Loger.GetInstance();
        Loger l2 = Loger.GetInstance();

        if (l1 == l2)
        {
            Console.WriteLine("Both Instances are Same:");
        }

        l1.Log("Initialized Components:");
        l2.Log("Database Connected:");
    }
}