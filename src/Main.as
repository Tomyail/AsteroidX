package
{

    import flash.display.Sprite;
    import flash.events.Event;

    import starling.core.Starling;

    public class Main extends Sprite
    {
        public function Main()
        {
            addEventListener( Event.ENTER_FRAME, init );
        }

        private var starling:Starling;
        private function init( event : Event ) : void
        {
            if( stage.stageWidth && stage.stageHeight )
            {
                stage.color = 0x000000;
                removeEventListener( Event.ENTER_FRAME, init );
                starling = new Starling( AsteroidX, stage );
                starling.antiAliasing = 0;
                starling.start();
            }
        }
    }
}
