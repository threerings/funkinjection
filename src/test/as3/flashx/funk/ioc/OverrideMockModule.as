package flashx.funk.ioc {
import flashx.funk.ioc.AbstractModule;

public class OverrideMockModule extends AbstractModule
{
    public function OverrideMockModule ()
    {
        bind(String).toInstance("From Override");
    }
}
}
