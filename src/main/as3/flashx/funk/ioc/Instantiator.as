package flashx.funk.ioc {
internal class Instantiator {
    internal var _module :AbstractModule;
    internal var _for :Array;
    internal var _of: Class;
    internal var _provider: Class;
    internal var _singleton: Boolean;
    internal var _evaluated: Boolean;
    internal var _value: *;

    public function Instantiator (module :AbstractModule, klass :Class)
    {
        _module = module;
        _for = [klass];
        _of = klass;
    }

    internal function setInstance (instance :*) :void
    {
        // TODO - check provider, instance null, instance same type as of
        _singleton = true;
        _evaluated = true;
        _value = instance;
        _module._map[_of] = this;
    }

    internal function setProvider (provider :Class) :void
    {
        // TODO - check instance null
        _provider = provider;
        _module._map[_of] = this;
    }

    internal function asSingleton () :void
    {
        _singleton = true;
        _module._map[_of] = this;
    }

    internal function getInstance(): * {
        if (_singleton) {
            if (_evaluated) {
                return _value;
            }
            _value = solve();
            _evaluated = true;
            return _value;
        } else {
            return solve();
        }
    }

    private function solve(): * {
        if (_provider != null) {
            return IProvider(_module.getInstance(_provider)).get();
        } else {
            return new _of;
        }
    }
}
}
