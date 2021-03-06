/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 10:43
 */
package system
{
    import ash.core.Engine;
    import ash.core.NodeList;
    import ash.core.System;

    import flash.geom.Point;

    import nodes.AsteroidCollisionNode;
    import nodes.PlayerBulletCollisionNode;

    import nodes.GameNode;
    import nodes.SpaceshipNode;

    public class GameManager extends System
    {
        public function GameManager(creator : EntityCreator, config : GameConfig)
        {
            super();
            this.config = config;
            this.creator = creator;
        }
        private var config : GameConfig;
        private var creator : EntityCreator;

        private var gameNodes : NodeList;
        private var spaceships : NodeList;
        private var asteroids : NodeList;
        private var bullets : NodeList;

        override public function addToEngine( engine : Engine ) : void
        {
            gameNodes = engine.getNodeList( GameNode );
            spaceships = engine.getNodeList( SpaceshipNode );
            asteroids = engine.getNodeList( AsteroidCollisionNode );
            bullets = engine.getNodeList( PlayerBulletCollisionNode );
        }

        override public function update( time : Number ) : void
        {
            var node : GameNode = gameNodes.head;
            if( node && node.state.playing )
            {
                if( spaceships.empty )
                {
                    if( node.state.lives > 0 )
                    {
                        var newSpaceshipPosition : Point = new Point( config.width * 0.5, config.height * 0.5 );
                        var clearToAddSpaceship : Boolean = true;
                        for( var asteroid : AsteroidCollisionNode = asteroids.head; asteroid; asteroid = asteroid.next )
                        {
                            if( Point.distance( asteroid.position.position, newSpaceshipPosition ) <= asteroid.collision.radius + 50 )
                            {
                                clearToAddSpaceship = false;
                                break;
                            }
                        }
                        if( clearToAddSpaceship )
                        {
                            creator.createSpaceship();
                        }
                    }
                    else
                    {
                        // game over
                        node.state.playing = false;
                        creator.createMenu();
                    }
                }

                if( asteroids.empty  && !spaceships.empty )
                {
                    // next level
                    var spaceship : SpaceshipNode = spaceships.head;
                    node.state.level++;
                    var asteroidCount : int = 2 + node.state.level;
                    for( var i:int = 0; i < asteroidCount; ++i )
                    {
                        // check not on top of spaceship
                        do
                        {
                            var position : Point = new Point( Math.random() * config.width, Math.random() * config.height );
                        }
                        while ( Point.distance( position, spaceship.position.position ) <= 80 );
                        creator.createAsteroid( 30, position.x, position.y );
                    }
                }
            }
        }

        override public function removeFromEngine( engine : Engine ) : void
        {
            gameNodes = null;
            spaceships = null;
//            asteroids = null;
//            bullets = null;
        }
    }
}
