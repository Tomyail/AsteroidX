/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 10:26
 */
package component
{
    public class GameState
    {
        public var lives:int = 0;
        public var level:int = 0;
        public var points:int = 0;
        public var playing:Boolean = false;

        public function GameState()
        {
        }

        public function setForStart():void
        {
            playing = true;

            lives = 3;
            level = 0;
            points = 0;
        }
    }
}
