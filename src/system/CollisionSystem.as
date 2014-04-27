package system
{
    import ash.core.Engine;
    import ash.core.NodeList;
    import ash.core.System;

    import flash.geom.Point;

    import nodes.AsteroidCollisionNode;
    import nodes.EnemyBulletCollisiobNode;
    import nodes.PlayerBulletCollisionNode;
    import nodes.GameNode;
    import nodes.SpaceshipCollisionNode;

    public class CollisionSystem extends System
    {
        private var creator:EntityCreator;

        private var spaceships:NodeList;
        private var asteroids:NodeList;
        private var playerBullets:NodeList;
        private var enemyBullets:NodeList;
        private var game:NodeList

        public function CollisionSystem(creator:EntityCreator)
        {
            this.creator = creator;
        }

        override public function addToEngine(engine:Engine):void
        {
            spaceships = engine.getNodeList(SpaceshipCollisionNode);
            asteroids = engine.getNodeList(AsteroidCollisionNode);
            playerBullets = engine.getNodeList(PlayerBulletCollisionNode);
            enemyBullets = engine.getNodeList(EnemyBulletCollisiobNode);
            game = engine.getNodeList(GameNode);
        }

        override public function update(time:Number):void
        {
            var playerBulletCollisionNode:PlayerBulletCollisionNode;
            var enemyBulletCollisionNode:EnemyBulletCollisiobNode;
            var asteroid:AsteroidCollisionNode;
            var spaceship:SpaceshipCollisionNode;

            for (playerBulletCollisionNode = playerBullets.head; playerBulletCollisionNode; playerBulletCollisionNode = playerBulletCollisionNode.next)
            {
                for (asteroid = asteroids.head; asteroid; asteroid = asteroid.next)
                {
                    if (Point.distance(asteroid.position.position, playerBulletCollisionNode.position.position) <= asteroid.collision.radius)
                    {
                        creator.destroyEntity(playerBulletCollisionNode.entity);
                        asteroid.life.currentBlood -= playerBulletCollisionNode.damage.hurt;
                        if (asteroid.life.currentBlood < 0)
                        {
                            if (asteroid.collision.radius > 10)
                            {
                                creator.createAsteroid(asteroid.collision.radius - 10, asteroid.position.position.x + Math.random() * 10 - 5, asteroid.position.position.y + Math.random() * 10 - 5);
                                creator.createAsteroid(asteroid.collision.radius - 10, asteroid.position.position.x + Math.random() * 10 - 5, asteroid.position.position.y + Math.random() * 10 - 5);
                            }
                            creator.destroyEntity(asteroid.entity);
                        }
                        break;
                    }
                }
            }


            for (spaceship = spaceships.head; spaceship; spaceship = spaceship.next)
            {
                for (asteroid = asteroids.head; asteroid; asteroid = asteroid.next)
                {
                    if (Point.distance(asteroid.position.position, spaceship.position.position) <= asteroid.collision.radius + spaceship.collision.radius)
                    {
                        game.head.state.lives--
                        creator.destroyEntity(spaceship.entity);
                        trace("destory")
                        break;
                    }
                }

                for (enemyBulletCollisionNode = enemyBullets.head; enemyBulletCollisionNode; enemyBulletCollisionNode = enemyBulletCollisionNode.next)
                {
                    if (Point.distance(spaceship.position.position, enemyBulletCollisionNode.position.position) <= spaceship.collision.radius)
                    {
                        spaceship.life.currentBlood -= enemyBulletCollisionNode.damage.hurt;
                        creator.destroyEntity(enemyBulletCollisionNode.entity);
                        if (spaceship.life.currentBlood < 0)
                        {
                            game.head.state.lives--
                            creator.destroyEntity(spaceship.entity);
                            trace("destory")
                            break;
                        }
                        break;
                    }
                }
            }
        }

        override public function removeFromEngine(engine:Engine):void
        {
            spaceships = null;
            asteroids = null;
            playerBullets = null;
        }
    }
}
