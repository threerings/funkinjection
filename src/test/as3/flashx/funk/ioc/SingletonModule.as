package flashx.funk.ioc {
import flashx.funk.ioc.AbstractModule;
public class SingletonModule extends AbstractModule {
    public function SingletonModule ()
    {
        bind(SingletonInstance).asSingleton();
        bind(SingletonInstance).to(SubSingletonInstance);
    }
}
}
