/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 9:45
 */
package
{
    import ash.core.Engine;
    import ash.integration.starling.StarlingFrameTickProvider;
    import ash.io.enginecodecs.JsonEngineCodec;

    import display.BulletView;

    import feathers.controls.Button;

    import feathers.themes.MetalWorksMobileTheme;

    import flash.geom.Rectangle;
    import flash.utils.ByteArray;
    import flash.utils.setTimeout;

    import input.KeyPoll;
    import input.TouchPoll;

    import starling.core.Starling;
    import starling.display.Sprite;
    import starling.events.Event;

    import system.BulletAgeSystem;
    import system.CollisionSystem;
    import system.EnemyGunControlSystem;

    import system.GameManager;
    import system.PlayerGunControlSystem;
    import system.LifeRenderSystem;
    import system.MovementSystem;
    import system.SpaceshipControlSystem;
    import system.RenderSystem;
    import system.SystemPriorities;
    import system.WaitForStartSystem;

    public class AsteroidX extends Sprite
    {
        public function AsteroidX()
        {
            super();
            addEventListener(Event.ADDED_TO_STAGE, startGame)
        }

        private var engine:Engine;
        private var tickProvider:StarlingFrameTickProvider;
        private var creator:EntityCreator;
        private var keyPoll:KeyPoll;
        private var config:GameConfig;
        private var touchPool:TouchPoll;

        [Embed(source="Data",mimeType="application/octet-stream")]
        private static const Data:Class;
        private function startGame(event:Event):void
        {
            prepare();
            start();
        }

        private function prepare():void
        {
            engine = new Engine();
            creator = new EntityCreator(engine);
            keyPoll = new KeyPoll(Starling.current.nativeStage);
            touchPool = new TouchPoll(Starling.current.nativeStage);
            var viewPort:Rectangle = Starling.current.viewPort;
            config = new GameConfig();
            config.width = viewPort.width;
            config.height = viewPort.height;

            new MetalWorksMobileTheme();


            engine.addSystem(new GameManager(creator, config), SystemPriorities.preUpdate);
            engine.addSystem(new SpaceshipControlSystem(touchPool), SystemPriorities.update);
            engine.addSystem(new PlayerGunControlSystem(creator), SystemPriorities.update);
            engine.addSystem(new BulletAgeSystem(creator), SystemPriorities.update);
            engine.addSystem(new MovementSystem(creator, config), SystemPriorities.move);
            engine.addSystem(new CollisionSystem(creator), SystemPriorities.resolveCollisions);
//            engine.addSystem( new AnimationSystem(), SystemPriorities.animate );
            engine.addSystem(new RenderSystem(this), SystemPriorities.render);
            engine.addSystem(new WaitForStartSystem(creator), SystemPriorities.preUpdate);
            engine.addSystem(new LifeRenderSystem(), SystemPriorities.render);
            engine.addSystem(new EnemyGunControlSystem(creator),SystemPriorities.update);
//

//            loadData();
            creator.createGame();

            creator.createMenu();

            //test save data
//            setTimeout(saveData,5000)
        }

        private function loadData():void
        {
            var codec : JsonEngineCodec = new JsonEngineCodec();
            codec.decodeEngine( Object((new Data as ByteArray).toString()),engine)
        }

        private function saveData():void
        {
            var codec : JsonEngineCodec = new JsonEngineCodec();
            var serialized : String = codec.encodeEngine( engine ) as String;
            trace(serialized)
//            var obj:Object = JSON.parse(serialized);
//            trace(obj);
//            stream.open( file, FileMode.WRITE );
//            stream.writeUTF( serialized );
//            stream.close();
        }

        private function start():void
        {
            tickProvider = new StarlingFrameTickProvider(Starling.current.juggler);
            tickProvider.add(engine.update);
            tickProvider.start();
        }
    }
}
