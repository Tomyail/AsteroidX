/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 10:52
 */
package nodes
{
    import ash.core.Node;

    import component.MotionControls;

    import component.Position;

    public class SpaceshipNode extends Node
    {
        public var position:Position;
        public var control:MotionControls;
//        public var shaceShip:spaces
        public function SpaceshipNode()
        {
            super();
        }
    }
}
