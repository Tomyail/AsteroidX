/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 18:54
 */
package component
{
    import display.LifeView;

    public class Life
    {
        public var view:LifeView
        public function Life(view:LifeView,blood:Number, lives:int = 1)
        {
            this.view = view;
            this.maxBloodPerLife = blood;
            this.lives = lives;
            this.totalBlood = lives * maxBloodPerLife;
            this.currentBlood = totalBlood;
        }

        public function update():void
        {
            view.updateLife(currentBlood,totalBlood);
        }

        public var maxBloodPerLife:Number;
        public var lives:int;
        public var totalBlood:Number;
        public var currentBlood:Number;

    }
}
