/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 17:21
 */
package display
{
    import ash.signals.Signal0;

    import feathers.controls.Button;

    import starling.display.Sprite;
    import starling.events.Event;

    public class MenuWinView extends Sprite
    {
        public var click:Signal0 = new Signal0();
        public function MenuWinView()
        {
            super();
            var button:Button = new Button();
            addChild(button);
            button.label = "不错哦";
            button.addEventListener(Event.TRIGGERED, triggeredHandler);
        }

        private function triggeredHandler(event:Event):void
        {
            click.dispatch();
        }
    }
}
