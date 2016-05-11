public class ConstrustorMethod {
    
    private static final Integer DEFAULT_SIZE = 10;
    
    Integer size;
    public ConstrustorMethod()
    {
        this(DEFAULT_SIZE);
    }
    
    public ConstrustorMethod(Integer objectSize)
    {
        size = objectSize;
    }
    public void get()
    {
        system.debug(DEFAULT_SIZE);
        system.debug(size);
    }
    //ConstrustorMethod myObject = new ConstrustorMethod(42);
    //ConstrustorMethod myObject2 = new ConstrustorMethod();

}