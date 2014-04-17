/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 18:54
 */
package component
{
    public class Life
    {
        public function Life(blood:Number,lives:int=1)
        {
            this.blood = blood;
            this.lives = lives
        }

        public var blood:Number;
        public var lives:int;
    }
}
