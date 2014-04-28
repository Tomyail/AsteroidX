package system
{
    import ash.tools.ListIteratingSystem;

    import component.Damage;
    import component.Gun;
    import component.Position;

    import nodes.PlayerGunNode;

    public class PlayerGunControlSystem extends ListIteratingSystem
	{
		private var creator : EntityCreator;
		
		public function PlayerGunControlSystem(creator : EntityCreator )
		{
			super( PlayerGunNode, updateNode );
			this.creator = creator;
		}

		private function updateNode( node : PlayerGunNode, time : Number ) : void
		{
//			var control : GunControls = node.control;
			var position : Position = node.position;
			var gun : Gun = node.gun;
            var damage:Damage = node.damage;

//			gun.shooting = keyPoll.isDown( control.trigger );
			gun.timeSinceLastShot += time;
			if ( gun.timeSinceLastShot >= gun.minimumShotInterval )
			{
				creator.createPlayerBullet( gun, position, damage,node.player);
				gun.timeSinceLastShot = 0;
			}
		}
	}
}
