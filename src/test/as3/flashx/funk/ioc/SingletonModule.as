package flashx.funk.ioc {
public class SingletonModule extends BindingModule {
    public function SingletonModule ()
    {
        bind(SingletonInstance).asSingleton();
        bind(SingletonInstance).to(SubSingletonInstance);

        bind(IntHolder).to(SubIntHolder);
        var iHolder :IntHolder = new SubIntHolder();
        iHolder.val = 7;
        bind(SubIntHolder).toInstance(iHolder);
    }
}
}
