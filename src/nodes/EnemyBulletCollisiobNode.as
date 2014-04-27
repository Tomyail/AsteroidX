/**
 * User: xuexin.li
 * Date: 2014/4/27
 * Time: 16:50
 */
package nodes
{
    import ash.core.Node;

    import component.Bullet;
    import component.Collision;
    import component.Damage;
    import component.EnemyBullet;
    import component.Position;

    public class EnemyBulletCollisiobNode extends Node
    {
        public var bullet:EnemyBullet;
        public var position:Position;
        public var collision:Collision;
        public var damage:Damage;
        public function EnemyBulletCollisiobNode()
        {
        }
    }
}
