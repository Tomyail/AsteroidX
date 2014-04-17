package system
{
    import ash.core.Engine;
    import ash.core.NodeList;
    import ash.core.System;

    import component.Display;
    import component.Position;

    import nodes.RenderNode;

    import starling.display.DisplayObject;
    import starling.display.DisplayObjectContainer;

    public class RenderSystem extends System
	{
		public var container : DisplayObjectContainer;

        private var _nodes : NodeList;

        public function RenderSystem( container : DisplayObjectContainer )
        {
            this.container = container;
        }

        override public function addToEngine( engine : Engine ) : void
        {
            _nodes = engine.getNodeList( RenderNode );
            for( var node : RenderNode = _nodes.head; node; node = node.next )
            {
                addToDisplay( node );
            }
            _nodes.nodeAdded.add( addToDisplay );
            _nodes.nodeRemoved.add( removeFromDisplay );
        }

        private function addToDisplay( node : RenderNode ) : void
        {
            container.addChild( node.display.displayObject );
        }

        private function removeFromDisplay( node : RenderNode ) : void
        {
            container.removeChild( node.display.displayObject );
        }

        override public function update( time : Number ) : void
        {
            var node : RenderNode;
            var position : Position;
            var display : Display;
            var displayObject : DisplayObject;

            for( node = _nodes.head; node; node = node.next )
            {
                display = node.display;
                displayObject = display.displayObject;
                position = node.position;

                displayObject.x = position.position.x;
                displayObject.y = position.position.y;
                displayObject.rotation = position.rotation;
            }
        }

        override public function removeFromEngine( engine : Engine ) : void
        {
            _nodes = null;
        }
	}
}
