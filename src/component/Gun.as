package component
{
    import flash.geom.Point;

    public class Gun
	{
		public var offsetFromParent : Point;
		public var timeSinceLastShot : Number;
		public var minimumShotInterval : Number;
		public var bulletLifetime : Number;
        public var bulletSpeed:Number;
		
		public function Gun( offsetX : Number, offsetY : Number, minimumShotInterval : Number, bulletLifetime : Number )
		{
            timeSinceLastShot = 0;
            bulletSpeed = 200;
			offsetFromParent = new Point( offsetX, offsetY );
			this.minimumShotInterval = minimumShotInterval;
			this.bulletLifetime = bulletLifetime;
		}
	}
}
