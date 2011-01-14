package flashx.funk.ioc {
public class OrderingModule extends AbstractModule {
    public function OrderingModule ()
    {
        bind(IntHolder).toProvider(IntHolderProvider);
    }
}
}
