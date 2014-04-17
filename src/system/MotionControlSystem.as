package system
{
    import ash.tools.ListIteratingSystem;

    import component.MotionControls;

    import component.Position;

    import input.TouchPoll;

    import nodes.SpaceshipNode;

    public class MotionControlSystem extends ListIteratingSystem
	{
		private var keyPoll : TouchPoll;

		public function MotionControlSystem( keyPoll : TouchPoll )
		{
			super( SpaceshipNode, updateNode );
			this.keyPoll = keyPoll;
		}

		private function updateNode( node : SpaceshipNode, time : Number ) : void
		{
			var control : MotionControls = node.control;
			var position : Position = node.position;
//			var motion : Motion = node.motion;

            position.position.x = keyPoll.globalX;
            position.position.y = keyPoll.globalY
//			if ( keyPoll.isDown( control.left ) )
//			{
//				position.rotation -= control.rotationRate * time;
//			}
//
//			if ( keyPoll.isDown( control.right ) )
//			{
//				position.rotation += control.rotationRate * time;
//			}
//
//			if ( keyPoll.isDown( control.accelerate ) )
//			{
//				motion.velocity.x += Math.cos( position.rotation ) * control.accelerationRate * time;
//				motion.velocity.y += Math.sin( position.rotation ) * control.accelerationRate * time;
//			}
		}
	}
}
