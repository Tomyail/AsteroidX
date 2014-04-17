/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 17:55
 */
package system
{
    import ash.core.Engine;
    import ash.core.NodeList;
    import ash.core.System;

    import nodes.AsteroidCollisionNode;
    import nodes.GameNode;
    import nodes.MenuNode;

    public class WaitForStartSystem extends System
    {
        public function WaitForStartSystem(creator:EntityCreator)
        {
            this.creator = creator
        }

        private var engine : Engine;
        private var creator : EntityCreator;

        private var gameNodes : NodeList;
        private var waitNodes : NodeList;
        private var asteroids : NodeList;
        override public function addToEngine( engine : Engine ) : void
        {
            this.engine = engine;
            waitNodes = engine.getNodeList( MenuNode );
            gameNodes = engine.getNodeList( GameNode );
            asteroids = engine.getNodeList( AsteroidCollisionNode );
        }

        override public function update( time : Number ) : void
        {
            var node :MenuNode = waitNodes.head;
            var game : GameNode = gameNodes.head;
            if( node && node.menu.gameStart && game )
            {
                for( var asteroid : AsteroidCollisionNode = asteroids.head; asteroid; asteroid = asteroid.next )
                {
                    creator.destroyEntity( asteroid.entity );
                }

                game.state.setForStart();
                node.menu.gameStart = false;
                engine.removeEntity( node.entity );
            }
        }

        override public function removeFromEngine( engine : Engine ) : void
        {
            gameNodes = null;
            waitNodes = null;
        }
    }
}
