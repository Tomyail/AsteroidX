/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 14:12
 */
package nodes
{
    import ash.core.Node;

    import component.Bullet;
    import component.EnemyBullet;
    import component.PlayerBullet;

    public class PlayerBulletAgeNode extends Node
    {
        public var bullet:PlayerBullet;
        public function PlayerBulletAgeNode()
        {
            super();
        }
    }
}
