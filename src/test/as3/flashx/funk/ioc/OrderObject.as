package flashx.funk.ioc {
public class OrderObject {
    public var beforeConstructor :IntHolder = inject(IntHolder);

    public function OrderObject ()
    {
        inConstructor = inject(IntHolder);
    }

    public var afterConstructor :IntHolder = inject(IntHolder);

    public var inConstructor :IntHolder;
}
}
