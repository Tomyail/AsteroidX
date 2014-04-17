package nodes
{
    import ash.core.Node;

    import component.Asteroid;
    import component.Collision;
    import component.Position;

    public class AsteroidCollisionNode extends Node
	{
		public var asteroid : Asteroid;
		public var position : Position;
		public var collision : Collision;
	}
}
