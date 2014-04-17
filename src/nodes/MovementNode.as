/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 15:21
 */
package nodes
{
    import ash.core.Node;

    import component.Motion;

    import component.Position;

    public class MovementNode extends Node
    {
        public var position:Position;
        public var motion:Motion;
        public function MovementNode()
        {
            super();
        }
    }
}
