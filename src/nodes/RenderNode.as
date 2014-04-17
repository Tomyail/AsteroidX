/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 10:58
 */
package nodes
{
    import ash.core.Node;

    import component.Display;
    import component.Position;

    public class RenderNode extends Node
    {
        public function RenderNode()
        {
            super();
        }
        public var display:Display;
        public var position:Position;
    }
}
