package DataStructureAlgorithm.exercise7;

import java.util.HashMap;
import java.util.Map;

public class FinancialForecast {

    // Stores already calculated results for the optimized recursive method.
    private static final Map<Integer, Double> cache = new HashMap<>();

    // Basic recursion: grows the value year by year until no years are left.
    public static double predictFutureValue(double currentValue, double growthRate, int years) {
        if (years == 0) {
            return currentValue;
        }
        return predictFutureValue(currentValue * (1 + growthRate), growthRate, years - 1);
    }

    // Recursion with memoization: reuses previous results to avoid recalculating.
    public static double predictFutureValueOptimized(double currentValue, double growthRate, int years) {
        if (years == 0) {
            return currentValue;
        }
        if (cache.containsKey(years)) {
            return cache.get(years);
        }

        double result = predictFutureValueOptimized(currentValue, growthRate, years - 1) * (1 + growthRate);
        cache.put(years, result);
        return result;
    }

    // Iterative version: usually the simplest and most memory-efficient approach.
    public static double predictFutureValueIterative(double currentValue, double growthRate, int years) {
        double result = currentValue;
        for (int i = 0; i < years; i++) {
            result *= (1 + growthRate);
        }
        return result;
    }

    public static void main(String[] args) {
        double initialInvestment = 1000.0;
        double annualGrowthRate = 0.05;
        int forecastYears = 10;

        System.out.println("Financial Forecasting Demo\n");
        System.out.println("Initial Investment: Rs" + initialInvestment);
        System.out.println("Annual Growth Rate: " + (annualGrowthRate * 100) + "%");
        System.out.println("Forecast Years: " + forecastYears + "\n");

        // Method 1: Basic recursive calculation.
        long startTime = System.nanoTime();
        double result1 = predictFutureValue(initialInvestment, annualGrowthRate, forecastYears);
        long endTime = System.nanoTime();
        System.out.println("Method 1: Basic Recursion");
        System.out.printf("Future Value: Rs%.2f%n", result1);
        System.out.println("Time taken: " + (endTime - startTime) + " ns\n");

        // Method 2: Optimized recursion using cached values.
        cache.clear();
        startTime = System.nanoTime();
        double result2 = predictFutureValueOptimized(initialInvestment, annualGrowthRate, forecastYears);
        endTime = System.nanoTime();
        System.out.println("Method 2: Recursion with Memoization");
        System.out.printf("Future Value: Rs%.2f%n", result2);
        System.out.println("Time taken: " + (endTime - startTime) + " ns\n");

        // Method 3: Loop-based calculation.
        startTime = System.nanoTime();
        double result3 = predictFutureValueIterative(initialInvestment, annualGrowthRate, forecastYears);
        endTime = System.nanoTime();
        System.out.println("Method 3: Iterative (Loop)");
        System.out.printf("Future Value: Rs%.2f%n", result3);
        System.out.println("Time taken: " + (endTime - startTime) + " ns\n");

        // Show forecasted value for each year from 0 up to the target year.
        System.out.println("Year-by-Year Growth (Using Optimized Recursion)");
        System.out.println("Year - Value");
        for (int year = 0; year <= forecastYears; year++) {
            cache.clear();
            double value = predictFutureValueOptimized(initialInvestment, annualGrowthRate, year);
            System.out.printf("%4d - Rs%.2f%n", year, value);
        }

        // Simple summary of time and space complexity.
        System.out.println("\n=== Complexity Analysis ===");
        System.out.println("Method 1 (Basic Recursion): O(n) time, O(n) space");
        System.out.println("Method 2 (Memoization):     O(n) time, O(n) space");
        System.out.println("Method 3 (Iterative):       O(n) time, O(1) space");
    }
}
