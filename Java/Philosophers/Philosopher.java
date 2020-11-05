/**
 * Philosopher with Runnable Interface gets 2 Sticks, can think and eat.
 */
public class Philosopher implements Runnable {

    private final int number;
    private final Object leftStick;
    private  final Object rightStick;

    /**
     * Create a philosopher with sticks
     * @param number Just a number as int
     * @param leftStick
     * @param rightStick
     */
    public Philosopher(int number, Object leftStick, Object rightStick) {
        this.number = number;
        this.leftStick = leftStick;
        this.rightStick = rightStick;
    }

    /**
     * Snoo Snoo with random ms, 0-99
     */
    public void snooze() {
        long rng = ((long)(Math.random() *100));
        try {
            Thread.sleep(rng);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return;
    }

    /**
     * Do an Action specified in something and then snooze.
     * @param something performed Action
     */
    public void doActionWithSnooze(String something) {
        System.out.println("Philosopher " + this.number + " " + something);
        this.snooze();
        return;
    }

    /**
     * Do an Action specified in something
     * @param something performed Action
     */
    public void doAction(String something) {
        System.out.println("Philosopher " + this.number + " "  + something);
        return;
    }

    /**
     * First think for rng amount of time in ms, then take left Stick first, then right stick.
     * Deadlock is NOT catched.
     */
    @Override
    public void run() {
        while(true) {
            this.doActionWithSnooze("is thinking."); //think before eat
            synchronized (this.leftStick){ // Left first
                this.doAction("took left Stick.");
                synchronized (this.rightStick) { //now right Stick
                    this.doAction("took right Stick.");
                    this.doActionWithSnooze("is eating."); //eat
                }
            }
            doAction("finished eating.");
        }
    }
    /**
     * Deadlock possible, can be solved when last philosopher takes right stick first.
     */
}
