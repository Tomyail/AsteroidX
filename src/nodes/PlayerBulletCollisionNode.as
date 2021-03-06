package nodes
{
    import ash.core.Node;

    import component.Bullet;
    import component.Collision;
    import component.Damage;
    import component.PlayerBullet;
    import component.Position;

    public class PlayerBulletCollisionNode extends Node
    {
        public var bullet:PlayerBullet;
        public var position:Position;
        public var collision:Collision;
        public var damage:Damage;
    }
}
