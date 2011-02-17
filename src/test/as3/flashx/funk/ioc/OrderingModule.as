package flashx.funk.ioc {
public class OrderingModule extends BindingModule {
    public function OrderingModule ()
    {
        bind(IntHolder).toProvider(IntHolderProvider);
    }
}
}
