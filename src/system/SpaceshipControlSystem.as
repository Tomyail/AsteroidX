package system
{
    import ash.core.Engine;
    import ash.core.NodeList;
    import ash.core.System;

    import component.Position;

    import input.TouchPoll;

    import nodes.PlayerGunNode;
    import nodes.SpaceshipNode;

    public class SpaceshipControlSystem extends System
	{
		private var keyPoll : TouchPoll;

        private var players:NodeList;
        private var gunNodes:NodeList
		public function SpaceshipControlSystem( keyPoll : TouchPoll )
		{
			this.keyPoll = keyPoll;
		}


        override public function addToEngine(engine:Engine):void
        {
            players = engine.getNodeList(SpaceshipNode);
            gunNodes = engine.getNodeList(PlayerGunNode);
        }

        override public function removeFromEngine(engine:Engine):void
        {
            players = null;
            gunNodes = null;
        }

        override public function update(time:Number):void
        {
            updateNode(players);
            updateNode(gunNodes);
        }


        private function updateNode( list : NodeList) : void
		{
            var node:Object
            for( node = list.head; node; node = node.next )
            {
                var position : Position = node.position;
                position.position.x = keyPoll.globalX;
                position.position.y = keyPoll.globalY;
            }
		}
	}
}
