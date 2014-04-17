/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 10:14
 */
package
{
    import ash.core.Engine;
    import ash.core.Entity;

    import component.Bullet;
    import component.Display;
    import component.GameState;
    import component.Gun;
    import component.Motion;
    import component.Position;
    import component.Spaceship;

    import display.BulletView;
    import display.SpaceshipView;

    public class EntityCreator
    {
        private var engine:Engine;

        public function EntityCreator(engine:Engine)
        {
            this.engine = engine;
        }

        public function createGame():Entity
        {
            var gameEntity:Entity = new Entity()
                    .add(new GameState());
            engine.addEntity(gameEntity);
            return gameEntity;
        }

        public function createSpaceship():Entity
        {
            var e:Entity = new Entity()
                    .add(new Position(50, 50,-90))
                    .add(new Gun(0,0,0.05,20,true))
                    .add(new Spaceship())
                    .add(new Display(new SpaceshipView()));
            engine.addEntity(e);
            return e;
        }

        public function createUserBullet(gun:Gun, parentPosition:Position):Entity
        {
//            var cos : Number = Math.cos( parentPosition.rotation );
//            var sin : Number = Math.sin( parentPosition.rotation );
            var bullet : Entity = new Entity()
                    .add( new Bullet( gun.bulletLifetime ) )
                    .add( new Position(parentPosition.position.x,parentPosition.position.y,0))
//                                    cos * gun.offsetFromParent.x - sin * gun.offsetFromParent.y + parentPosition.position.x,
//                                    sin * gun.offsetFromParent.x + cos * gun.offsetFromParent.y + parentPosition.position.y, 0 ) )
//                    .add( new Collision( 0 ) )
                    .add( new Motion(0,-500,0,0) )
                    .add( new Display( new BulletView() ) );
            engine.addEntity( bullet );
            return bullet;
        }

        public function destroyEntity( entity : Entity ) : void
        {
            engine.removeEntity( entity );
        }
    }
}
