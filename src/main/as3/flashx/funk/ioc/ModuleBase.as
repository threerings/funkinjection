//
// $Id: $

package flashx.funk.ioc {

public class ModuleBase
    implements Module
{
    /**
     * Acquire an instance of the given class in the binding scope of this module.
     * If no binding exists, the class is instantiated using 'new'.
     */
    public function getInstance (klass: Class, pushScope :Boolean=true): *
    {
        if (pushScope) {
            return Scopes.pushScopeAndCreate(this, klass, createInstance);
        } else {
            return createInstance(klass);
        }
    }

    /**
     * Execute the provided function with this module as the current binding scope.
     */
    public function inject (run :Function) :*
    {
        return Scopes.pushScopeAndRun(this, run);
    }    

    public function binds (klass: Class) :Boolean
    {
        // MUST BE IMPLEMENTED BY SUBCLASS
        return false;
    }

    internal function createInstance (klass :Class) :*
    {
        // MUST BE IMPLEMENTED BY SUBCLASS
    }
}
}
