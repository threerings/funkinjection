package flashx.funk.ioc {
public class AliasModule extends AbstractModule {
    public function AliasModule ()
    {
        bind(IntHolder).toProvider(IntHolderProvider);
        bind(SubIntHolder).to(SubSubIntHolder);
        bind(IntHolder).to(SubIntHolder);
    }
}
}
