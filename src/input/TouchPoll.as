/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 11:43
 */
package input
{
    import flash.display.Stage;

    public class TouchPoll
    {
        private var stage:Stage;

        public function TouchPoll(stage:Stage)
        {
            this.stage = stage;
        }

        public function get globalX():Number
        {
            return stage.mouseX;
        }

        public function get globalY():Number
        {
            return stage.mouseY;
        }
    }
}
