package system
{
    import ash.core.Engine;
    import ash.core.NodeList;
    import ash.core.System;

    import component.Bullet;

    import nodes.EnemyBulletAgeNode;
    import nodes.PlayerBulletAgeNode;

    public class BulletAgeSystem extends System
    {
        private var creator:EntityCreator;
        private var playerBulletAgeNode:NodeList;
        private var enemyBulletAgeNodes:NodeList;

        public function BulletAgeSystem(creator:EntityCreator)
        {
            this.creator = creator;
        }

        override public function addToEngine(engine:Engine):void
        {
            playerBulletAgeNode = engine.getNodeList(PlayerBulletAgeNode);
            enemyBulletAgeNodes = engine.getNodeList(EnemyBulletAgeNode);
        }


        override public function update(time:Number):void
        {
            updateNode(playerBulletAgeNode, time);
            updateNode(enemyBulletAgeNodes, time);

        }

        private function updateNode(list:NodeList, time:Number):void
        {
            var n:Object
            for (n = list.head; n; n = n.next)
            {
                var bullet:Bullet = n.bullet;
                bullet.lifeRemaining -= time;
                if (bullet.lifeRemaining <= 0)
                {
                    creator.destroyEntity(n.entity);
                }
            }

        }

        override public function removeFromEngine(engine:Engine):void
        {
            playerBulletAgeNode = null;
            enemyBulletAgeNodes = null;
        }

    }
}
