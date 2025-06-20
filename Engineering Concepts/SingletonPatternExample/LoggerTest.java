public class LoggerTest {
    public static void main(String[] args) {

        // 4.1: Get first logger reference
        Logger logger1 = Logger.getInstance();
        logger1.log("Application has started.");

        // 4.2: Get second logger reference
        Logger logger2 = Logger.getInstance();
        logger2.log("Performing initial setup...");

        // 4.3: Verify if both logger references point to the same object
        boolean sameInstance = logger1 == logger2;
        System.out.println("Both logger references are same: " + sameInstance);
    }
}
