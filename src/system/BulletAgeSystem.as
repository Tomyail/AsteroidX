package system
{
    import ash.tools.ListIteratingSystem;

    import component.Bullet;
    import component.PlayerBullet;

    import nodes.BulletAgeNode;

    public class BulletAgeSystem extends ListIteratingSystem
	{
		private var creator : EntityCreator;
		
		public function BulletAgeSystem( creator : EntityCreator )
		{
			super( BulletAgeNode, updateNode );
			this.creator = creator;
		}

		private function updateNode( node : BulletAgeNode, time : Number ) : void
		{
			var bullet : PlayerBullet = node.bullet;
			bullet.lifeRemaining -= time;
			if ( bullet.lifeRemaining <= 0 )
			{
				creator.destroyEntity( node.entity );
			}
		}

	}
}
