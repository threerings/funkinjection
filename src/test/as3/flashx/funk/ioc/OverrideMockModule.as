package flashx.funk.ioc {

public class OverrideMockModule extends BindingModule
{
    public function OverrideMockModule ()
    {
        bind(String).toInstance("From Override");
    }
}
}
