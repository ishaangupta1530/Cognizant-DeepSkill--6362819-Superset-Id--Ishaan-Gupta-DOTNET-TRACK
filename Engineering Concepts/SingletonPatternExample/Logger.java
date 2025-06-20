public class Logger {

    // 2.1: Private static instance of the class
    private static Logger instance;

    // 2.2: Private constructor to restrict direct instantiation
    private Logger() {
        System.out.println("Logger started.");
    }

    // 2.3: Public static method to get the single instance
    public static Logger getInstance() {
        if (instance == null) {
            synchronized (Logger.class) {
                if (instance == null) {
                    instance = new Logger();
                }
            }
        }
        return instance;
    }

    // Optional utility method to simulate logging
    public void log(String message) {
        System.out.println("[LOG]: " + message);
    }
}
