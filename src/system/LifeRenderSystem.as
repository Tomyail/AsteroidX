/**
 * User: xuexin.li
 * Date: 2014/4/19
 * Time: 18:29
 */
package system
{
    import ash.core.Engine;
    import ash.core.NodeList;
    import ash.core.System;

    import nodes.LifeNode;

    public class LifeRenderSystem extends System
    {
        public function LifeRenderSystem()
        {
        }


        private var lives:NodeList;

        override public function addToEngine(engine:Engine):void
        {
            lives = engine.getNodeList(LifeNode);
        }

        private var life:LifeNode;
        override public function update(time:Number):void
        {
            for (life = lives.head; life; life = life.next)
            {
                life.life.update();
            }
        }
    }
}
