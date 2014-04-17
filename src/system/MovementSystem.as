package system
{
    import ash.tools.ListIteratingSystem;

    import component.Motion;
    import component.Position;

    import nodes.MovementNode;

    public class MovementSystem extends ListIteratingSystem
	{
		private var config : GameConfig;
        private var creator:EntityCreator;
		
		public function MovementSystem(creator:EntityCreator, config : GameConfig )
		{
			this.config = config;
            this.creator = creator;
			
			super( MovementNode, updateNode );
		}

		private function updateNode( node : MovementNode, time : Number ) : void
		{
			var position : Position = node.position;
			var motion : Motion = node.motion;
            var shouldDispose:Boolean = false;

			position.position.x += motion.velocity.x * time;
			position.position.y += motion.velocity.y * time;
			if ( position.position.x < 0 )
			{
				position.position.x += config.width;
                shouldDispose = true;
			}
			if ( position.position.x > config.width )
			{
				position.position.x -= config.width;
                shouldDispose = true;
			}
			if ( position.position.y < 0 )
			{
				position.position.y += config.height;
                shouldDispose = true;
			}
			if ( position.position.y > config.height )
			{
				position.position.y -= config.height;
                shouldDispose = true;
			}
            if(shouldDispose)
            {
                creator.destroyEntity(node.entity);
            }
//			position.rotation += motion.angularVelocity * time;
//			if ( motion.damping > 0 )
//			{
//				var xDamp : Number = Math.abs( Math.cos( position.rotation ) * motion.damping * time );
//				var yDamp : Number = Math.abs( Math.sin( position.rotation ) * motion.damping * time );
//				if ( motion.velocity.x > xDamp )
//				{
//					motion.velocity.x -= xDamp;
//				}
//				else if ( motion.velocity.x < -xDamp )
//				{
//					motion.velocity.x += xDamp;
//				}
//				else
//				{
//					motion.velocity.x = 0;
//				}
//				if ( motion.velocity.y > yDamp )
//				{
//					motion.velocity.y -= yDamp;
//				}
//				else if ( motion.velocity.y < -yDamp )
//				{
//					motion.velocity.y += yDamp;
//				}
//				else
//				{
//					motion.velocity.y = 0;
//				}
//			}
		}
	}
}
