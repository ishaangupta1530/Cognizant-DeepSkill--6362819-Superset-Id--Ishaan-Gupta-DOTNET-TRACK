using System;

class FinancialForecast
{
    public static double FutureValue(double principal, double rate, int years)
    {
        if (years == 0) return principal;
        return FutureValue(principal, rate, years - 1) * (1 + rate);
    }

    static void Main(string[] args)
    {
        double principal = 10000;
        double growthRate = 0.05;
        int periods = 5;

        double result = FutureValue(principal, growthRate, periods);
        Console.WriteLine($"Future Value after {periods} years: {result:F2}");
    }
}
// Result
