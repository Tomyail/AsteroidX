/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 10:52
 */
package nodes
{
    import ash.core.Node;


    import component.Position;
    import component.Spaceship;

    public class SpaceshipNode extends Node
    {
        public var position:Position;
        public var spaceship:Spaceship;
        public function SpaceshipNode()
        {
            super();
        }
    }
}
