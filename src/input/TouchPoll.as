/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 11:43
 */
package input
{
    import starling.display.Stage;
    import starling.events.Touch;
    import starling.events.TouchEvent;

    public class TouchPoll
    {
        private var stage:Stage;
        public function TouchPoll(stage:Stage)
        {
            this.stage = stage;
            stage.addEventListener(TouchEvent.TOUCH,touchHandler)
        }

        public var globalX:Number;
        public var globalY:Number;
        public var lastTouch:Touch;
        private function touchHandler(event:TouchEvent):void
        {
            var touch:Touch = event.getTouch(stage);
            if(touch)
            {
                lastTouch = touch;
                globalX = touch.globalX;
                globalY = touch.globalY;
            }
        }
    }
}
