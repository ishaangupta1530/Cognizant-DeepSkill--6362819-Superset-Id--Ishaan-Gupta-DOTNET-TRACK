using System;

public class Logger
{
    private static Logger login;

    private Logger()
    {
        Console.WriteLine("Instance Created:");
    }

    public static Logger GetInstance()
    {
        if (login == null)
        {
            login = new Logger();
        }
        return login;
    }

    public void Log(string message)
    {
        Console.WriteLine("LoggedIn: " + message);
    }
}

public class LoggerTest
{
    public static void Main(string[] args)
    {
        Logger l1 = Logger.GetInstance();
        Logger l2 = Logger.GetInstance();

        if (l1 == l2)
        {
            Console.WriteLine("Both Instances are Same:");
        }

        l1.Log("Initialized Components:");
        l2.Log("Database Connected:");
    }
}
