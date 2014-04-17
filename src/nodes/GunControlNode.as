/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 13:42
 */
package nodes
{
    import ash.core.Node;

    import component.Gun;
    import component.Position;

    public class GunControlNode extends Node
    {
        public var gun:Gun;
        public var position:Position;
        public function GunControlNode()
        {
            super();
        }
    }
}
