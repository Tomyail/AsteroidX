/**
 * User: xuexin.li
 * Date: 2014/4/21
 * Time: 20:15
 */
package system
{
    import ash.core.Engine;
    import ash.core.NodeList;
    import ash.core.System;

    import nodes.EnemyGunNode;
    import nodes.PlayerGunNode;
    import nodes.SpaceshipNode;

    public class EnemyGunControlSystem extends System
    {
        private var creator:EntityCreator;

        public function EnemyGunControlSystem(creator:EntityCreator)
        {
            this.creator = creator;
        }

        private var gun:NodeList;
        private var player:NodeList


        override public function addToEngine(engine:Engine):void
        {
            gun = engine.getNodeList(EnemyGunNode);
            player = engine.getNodeList(SpaceshipNode);
        }

        override public function removeFromEngine(engine:Engine):void
        {
            gun = null;
            player = null;
        }

        override public function update(time:Number):void
        {
            var p:SpaceshipNode = player.head;
            var e:EnemyGunNode;
            if (p)
            {
                for (e = gun.head; e; e = e.next)
                {
//                    trace(Math.atan2(e.position.position.y - p.position.position.y, e.position.position.x - p.position.position.x) * 180 / Math.PI)
                    e.position.rotation = Math.atan2(p.position.position.y - e.position.position.y, p.position.position.x - e.position.position.x) + 90 * 180 / Math.PI
                    e.gun.timeSinceLastShot += time;
                    if(e.gun.timeSinceLastShot >= e.gun.minimumShotInterval)
                    {
                        creator.createUserBullet( e.gun, e.position, e.damage);
                        e.gun.timeSinceLastShot = 0;
                    }
                }
            }
        }

    }
}
