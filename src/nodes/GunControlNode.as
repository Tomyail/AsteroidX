/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 13:42
 */
package nodes
{
    import ash.core.Node;

    import component.Damage;

    import component.Gun;
    import component.Position;

    public class GunControlNode extends Node
    {
        public var gun:Gun;
        public var position:Position;
        public var damage:Damage
        public function GunControlNode()
        {
            super();
        }
    }
}
