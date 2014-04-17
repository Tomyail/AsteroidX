/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 17:24
 */
package component
{
    import display.MenuWinView;

    public class Menu
    {
        public var view:MenuWinView;
        public var gameStart:Boolean = false;
        public function Menu(view:MenuWinView)
        {
            this.view = view;
            view.click.add(clickHandler)
        }

        private function clickHandler():void
        {
            gameStart = true;
        }
    }
}
