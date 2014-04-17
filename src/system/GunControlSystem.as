package system
{
    import ash.tools.ListIteratingSystem;

    import component.Damage;

    import component.Gun;
    import component.Position;

    import nodes.GunControlNode;

    public class GunControlSystem extends ListIteratingSystem
	{
		private var creator : EntityCreator;
		
		public function GunControlSystem(creator : EntityCreator )
		{
			super( GunControlNode, updateNode );
			this.creator = creator;
		}

		private function updateNode( node : GunControlNode, time : Number ) : void
		{
//			var control : GunControls = node.control;
			var position : Position = node.position;
			var gun : Gun = node.gun;
            var damage:Damage = node.damage;

//			gun.shooting = keyPoll.isDown( control.trigger );
			gun.timeSinceLastShot += time;
			if ( gun.shooting && gun.timeSinceLastShot >= gun.minimumShotInterval )
			{
				creator.createUserBullet( gun, position, damage);
				gun.timeSinceLastShot = 0;
			}
		}
	}
}
