package nodes
{
    import ash.core.Node;

    import component.Bullet;
    import component.Collision;
    import component.Damage;
    import component.Position;

    public class BulletCollisionNode extends Node
    {
        public var bullet:Bullet;
        public var position:Position;
        public var collision:Collision;
        public var damage:Damage;
    }
}
