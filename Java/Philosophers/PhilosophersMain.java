/**
 * Create given amount of Philosophers and Sticks and start them as Threads.
 * False arguments r not catched, not necessary for the given task i got.
 * Same with deadlock
 */
public class PhilosophersMain {
    /**
     * You should give a number, but i dont care :)
     * @param args
     */
    public static void main(String[] args) {
        if(args.length < 1) {
            System.err.println("Not Enough Arguments");
            System.exit(-1);
        }
        Philosopher[] philosophers = new Philosopher[Integer.parseInt(args[0])];
        Object[] sticks = new Object[philosophers.length];

        //1 Stick for 1 Philosopher
        for (int i = 0; i < sticks.length; i++) {
            sticks[i] = new Object();
        }

        //Philosophers
        for (int i = 0; i < philosophers.length; i++) {
            philosophers[i] = new Philosopher(i, sticks[i], sticks[(i+1) % sticks.length]);
            Thread philosopherThread = new Thread(philosophers[i]);
            philosopherThread.start();
        }

    }
}
