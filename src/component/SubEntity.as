/**
 * User: xuexin.li
 * Date: 2014/4/19
 * Time: 17:53
 */
package component
{
    import ash.core.Entity;

    public class SubEntity
    {
        private var subEntity:Vector.<Entity>;
        public function SubEntity()
        {
            subEntity = new <Entity>[];
        }

        public function add(entity:Entity):SubEntity
        {
            if(subEntity.indexOf(entity)<0)
            {
                subEntity[subEntity.length] = entity;
            }
            return this;
        }

        public function contain(entity:Entity):Boolean
        {
            return subEntity.indexOf(entity)>=0
        }
        public function remove(entity:Entity):SubEntity
        {
            var idx:int = subEntity.indexOf(entity)
            if(idx>=0)
            {
                subEntity.splice(idx,1);
            }
            return this;
        }

        public function get tail():Entity
        {
            if(subEntity.length)
            {
                return subEntity[subEntity.length-1];
            }
            return null
        }

        public function pop():Entity
        {
            return subEntity.pop()
        }
    }
}
