//
// $Id: $

package flashx.funk.ioc {

/**
 * Searches through a list of modules given on construction for its bindings.
 */
public class ChainModule extends ModuleBase
    implements Module
{
    public function ChainModule (... modules)
    {
        for (var ii :int = 0; ii < modules.length; ii ++) {
            if (!(modules[ii] is Module)) {
                throw new Error("ChainModule argument is not an IModule");
            }
        }
        _modules = modules;
    }

    override public function binds (klass :Class):Boolean
    {
        return findBinder(klass) != null;
    }

    override internal function createInstance (klass :Class) :*
    {
        if (klass == Module) {
            return this;
        }
        const binder :Module = findBinder(klass);
        if (binder != null) {
            return binder.getInstance(klass, false);
        }
        return new klass;
    }

    protected function findBinder (klass :Class) :Module
    {
        for (var ii :int = 0; ii < _modules.length; ii++) {
            if (_modules[ii].binds(klass)) {
                return _modules[ii];
            }
        }
        return null;
    }

    protected var _modules :Array;
}
}
