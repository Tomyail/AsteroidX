package component
{
	import flash.geom.Point;
	
	public class Position
	{
		public var position : Point;
		public var rotation : Number;
		
		public function Position( x : Number, y : Number, rotation : Number )
		{
			position = new Point( x, y );
			this.rotation = rotation;
		}
	}
}
