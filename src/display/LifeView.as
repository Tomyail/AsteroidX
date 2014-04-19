/**
 * User: xuexin.li
 * Date: 2014/4/19
 * Time: 16:39
 */
package display
{
    import feathers.controls.Label;

    public class LifeView extends Label
    {
        public function LifeView()
        {
            super();
            updateLife(0,0);
        }

        public function updateLife(current:Number,total:Number):void
        {
            text = current +"/"+total;
        }
    }
}
