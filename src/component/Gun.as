package component
{
    import flash.geom.Point;

    public class Gun
	{
		public var shooting : Boolean = false;
		public var offsetFromParent : Point;
		public var timeSinceLastShot : Number;
		public var minimumShotInterval : Number;
		public var bulletLifetime : Number;
        public var bulletSpeed:Number;
		
		public function Gun( offsetX : Number, offsetY : Number, minimumShotInterval : Number, bulletLifetime : Number,shooting:Boolean = false )
		{
            bulletSpeed = 200;
            this.shooting = shooting;
			offsetFromParent = new Point( offsetX, offsetY );
			this.minimumShotInterval = minimumShotInterval;
			this.bulletLifetime = bulletLifetime;
		}
	}
}
