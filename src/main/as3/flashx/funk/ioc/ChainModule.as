//
// $Id: $

package flashx.funk.ioc {

/**
 * An abstract module that searches through a list of modules given on construction for
 * its bindings.
 */
public class ChainModule implements IModule
{
    public function ChainModule (... modules)
    {
        for (var ii :int = 0; ii < modules.size; ii ++) {
            if (!(modules is IModule)) {
                throw new Error("ChainModule argument is not an IModule");
            }
        }
        _modules = modules;
    }

    // from IModule
    public function getInstance (klass :Class):*
    {
        Scopes.pushScopeAndRun(this, new function () :* {
            for (var ii :int = 0; ii < _modules.size; ii ++) {
                if (_modules[ii].binds(klass)) {
                    return _modules[ii].getInstance(klass);
                }
            }
            return new klass;
        });
    }

    // from IModule
    public function binds (klass :Class):Boolean
    {
        for (var ii :int = 0; ii < _modules.size; ii ++) {
            if (_modules[ii].binds(klass)) {
                return true;
            }
        }
        return false;
    }

    protected var _modules :Array;
}
}
