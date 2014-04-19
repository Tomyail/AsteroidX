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
    import component.SubEntity;

    import display.AsteroidView;

    import display.BulletView;
    import display.LifeView;
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

        public function createSpaceship():void
        {
            var subEntity:SubEntity = new SubEntity();
            var lifeView:LifeView = new LifeView();
            //ship
            var pos:Position = new Position(50, 50, 0)
            var e:Entity = new Entity()
                    .add(pos)
                    .add(new Gun(0, 0, 0.05, 20, true))
                    .add(new Spaceship())
                    .add(new Collision(5))
                    .add(new Display(new SpaceshipView()))
                    .add(new Life(lifeView,300, 1))
                    .add(new Damage(20))
                    .add(subEntity);
            engine.addEntity(e);

            //life bar
            e = new Entity()
                    .add(new Display(lifeView))
                    .add(pos)
            subEntity.add(e);
            engine.addEntity(e);
        }

        public function createUserBullet(gun:Gun, parentPosition:Position, damage:Damage):Entity
        {
//            var cos : Number = Math.cos( parentPosition.rotation );
//            var sin : Number = Math.sin( parentPosition.rotation );
            var bullet:Entity = new Entity()
                    .add(new Bullet(gun.bulletLifetime))
                    .add(new Position(parentPosition.position.x, parentPosition.position.y, 0))
//                                    cos * gun.offsetFromParent.x - sin * gun.offsetFromParent.y + parentPosition.position.x,
//                                    sin * gun.offsetFromParent.x + cos * gun.offsetFromParent.y + parentPosition.position.y, 0 ) )
                    .add(new Collision(1))
                    .add(new Motion(0, -500, 0, 0))
                    .add(new Display(new BulletView()))
                    .add(damage);
            engine.addEntity(bullet);
            return bullet;
        }

        public function destroyEntity(entity:Entity):void
        {
            engine.removeEntity(entity);
            if(entity.has(SubEntity))
            {
                var sub:SubEntity = entity.get(SubEntity);
                while(sub.tail)
                {
                    destroyEntity(sub.pop())
                }
            }
        }

        public function createAsteroid(radius:Number, x:Number, y:Number):void
        {
            var subEntity:SubEntity = new SubEntity();
            var pos:Position = new Position(x, y, 0);
            var lifeView:LifeView = new LifeView();
            var asteroid:Entity = new Entity()
                    .add(new Asteroid())
                    .add(pos)
                    .add(new Collision(radius))
                    .add(new Motion(( Math.random() - 0.5 ) * 4 * ( 50 - radius ), ( Math.random() - 0.5 ) * 4 * ( 50 - radius ), Math.random() * 2 - 1, 0))
                    .add(new Display(new AsteroidView(radius)))
                    .add(new Life(lifeView,100, 1))
                    .add(new Damage(10))
                    .add(new Gun(0, 0, 0.05, 20, false))
                    .add(subEntity)
            engine.addEntity(asteroid);

            asteroid = new Entity()
                    .add(new Display(lifeView))
                    .add(pos)
            subEntity.add(asteroid);

            engine.addEntity(asteroid);
        }

        private var waitEntity:Entity;

        public function createMenu():Entity
        {
            if (!waitEntity)
            {
                var waitView:MenuWinView = new MenuWinView();

                waitEntity = new Entity("wait")
                        .add(new Menu(waitView))
                        .add(new Display(waitView))
                        .add(new Position(0, 0, 0));
            }
//            WaitForStart( waitEntity.get( WaitForStart ) ).startGame = false;
            engine.addEntity(waitEntity);
            return waitEntity;
        }
    }
}
