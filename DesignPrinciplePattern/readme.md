# Singleton Solution

### Logger class:
- private static Logger instance – holds the single instance.

- private Logger() – prevents external instantiation.

- public static Logger getInstance() – returns the instance (creates it only once).


### Test class:
- Calls getInstance() multiple times.

- Verifies all references point to the same object using ==.