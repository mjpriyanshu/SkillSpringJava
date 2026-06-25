package com.cognizant;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggingExample {

    // Create a logger instance for this class
    private static final Logger logger = LoggerFactory.getLogger(LoggingExample.class);

    public static void main(String[] args) {
        // Log an ERROR level message
        logger.error("This is an error message");

        // Log a WARN level message
        logger.warn("This is a warning message");

        // Optional: Log INFO level messages (for demonstration)
        logger.info("Application finished successfully");
    }
}


/*
Output:

22:31:44.128 [main] ERROR com.cognizant.LoggingExample - This is an error message
22:31:44.131 [main] WARN com.cognizant.LoggingExample - This is a warning message
22:31:44.131 [main] INFO com.cognizant.LoggingExample - Application finished successfully

*/