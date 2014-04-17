package nodes
{
    import ash.core.Node;

    import component.Collision;
    import component.Position;
    import component.Spaceship;

    public class SpaceshipCollisionNode extends Node
	{
		public var spaceship : Spaceship;
		public var position : Position;
		public var collision : Collision;
	}
}
