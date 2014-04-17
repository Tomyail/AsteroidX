/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 10:14
 */
package
{
    import ash.core.Engine;
    import ash.core.Entity;

    import component.Asteroid;

    import component.Bullet;
    import component.Collision;
    import component.Damage;
    import component.Display;
    import component.GameState;
    import component.Gun;
    import component.Life;
    import component.Menu;
    import component.Motion;
    import component.Position;
    import component.Spaceship;

    import display.AsteroidView;

    import display.BulletView;
    import display.MenuWinView;
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
                    .add(new Position(50, 50, -90))
                    .add(new Gun(0, 0, 0.05, 20, true))
                    .add(new Spaceship())
                    .add(new Collision(5))
                    .add(new Display(new SpaceshipView()))
                    .add(new Life(300,1))
                    .add(new Damage(20))
            engine.addEntity(e);
            return e;
        }

        public function createUserBullet(gun:Gun, parentPosition:Position,damage:Damage):Entity
        {
//            var cos : Number = Math.cos( parentPosition.rotation );
//            var sin : Number = Math.sin( parentPosition.rotation );
            var bullet:Entity = new Entity()
                    .add(new Bullet(gun.bulletLifetime))
                    .add(new Position(parentPosition.position.x, parentPosition.position.y, 0))
//                                    cos * gun.offsetFromParent.x - sin * gun.offsetFromParent.y + parentPosition.position.x,
//                                    sin * gun.offsetFromParent.x + cos * gun.offsetFromParent.y + parentPosition.position.y, 0 ) )
                    .add(new Collision( 1 ) )
                    .add(new Motion(0, -500, 0, 0))
                    .add(new Display(new BulletView()))
                    .add(damage);
            engine.addEntity(bullet);
            return bullet;
        }

        public function destroyEntity(entity:Entity):void
        {
            engine.removeEntity(entity);
        }

        public function createAsteroid(radius:Number, x:Number, y:Number):Entity
        {
            var asteroid:Entity = new Entity()
                    .add(new Asteroid())
                    .add(new Position(x, y, 0))
                    .add(new Collision(radius))
                    .add(new Motion(( Math.random() - 0.5 ) * 4 * ( 50 - radius ), ( Math.random() - 0.5 ) * 4 * ( 50 - radius ), Math.random() * 2 - 1, 0))
                    .add(new Display(new AsteroidView(radius)))
                    .add(new Life(100,1))
                    .add(new Damage(10))
                    .add(new Gun(0, 0, 0.05, 20, false))
            engine.addEntity(asteroid);
            return asteroid;
        }

        private var waitEntity:Entity;
        public function createMenu():Entity
        {
            if( !waitEntity )
            {
                var waitView : MenuWinView = new MenuWinView();

                waitEntity = new Entity( "wait" )
                        .add( new Menu( waitView ) )
                        .add( new Display( waitView ) )
                        .add( new Position( 0, 0, 0 ) );
            }
//            WaitForStart( waitEntity.get( WaitForStart ) ).startGame = false;
            engine.addEntity( waitEntity );
            return waitEntity;
        }
    }
}
