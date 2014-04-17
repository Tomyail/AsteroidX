/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 9:45
 */
package
{
    import ash.core.Engine;
    import ash.integration.starling.StarlingFrameTickProvider;

    import display.BulletView;

    import flash.geom.Rectangle;

    import input.KeyPoll;
    import input.TouchPoll;

    import starling.core.Starling;
    import starling.display.Sprite;
    import starling.events.Event;

    import system.BulletAgeSystem;
    import system.CollisionSystem;

    import system.GameManager;
    import system.GunControlSystem;
    import system.MovementSystem;
    import system.SpaceshipControlSystem;
    import system.RenderSystem;
    import system.SystemPriorities;

    public class AsteroidX extends Sprite
    {
        public function AsteroidX()
        {
            super();
            addEventListener(Event.ADDED_TO_STAGE, startGame)
        }

        private var engine : Engine;
        private var tickProvider : StarlingFrameTickProvider;
        private var creator : EntityCreator;
        private var keyPoll : KeyPoll;
        private var config : GameConfig;
        private var touchPool:TouchPoll;

        private function startGame(event:Event):void
        {
//            addChild(new BulletView())
            prepare();
            start();
        }

        private function prepare() : void
        {
            engine = new Engine();
            creator = new EntityCreator( engine );
            keyPoll = new KeyPoll( Starling.current.nativeStage );
            touchPool = new TouchPoll(this.stage);
            var viewPort : Rectangle = Starling.current.viewPort;
            config = new GameConfig();
            config.width = viewPort.width;
            config.height = viewPort.height;

            engine.addSystem( new GameManager( creator, config ), SystemPriorities.preUpdate );
            engine.addSystem( new SpaceshipControlSystem( touchPool ), SystemPriorities.update );
            engine.addSystem( new GunControlSystem( creator ), SystemPriorities.update );
            engine.addSystem( new BulletAgeSystem( creator ), SystemPriorities.update );
//            engine.addSystem( new DeathThroesSystem( creator ), SystemPriorities.update );
            engine.addSystem( new MovementSystem(creator, config ), SystemPriorities.move );
            engine.addSystem( new CollisionSystem( creator ), SystemPriorities.resolveCollisions );
//            engine.addSystem( new AnimationSystem(), SystemPriorities.animate );
            engine.addSystem( new RenderSystem( this ), SystemPriorities.render );
//
            creator.createGame();


        }

        private function start() : void
        {
            tickProvider = new StarlingFrameTickProvider( Starling.current.juggler );
            tickProvider.add( engine.update );
            tickProvider.start();
        }
    }
}
