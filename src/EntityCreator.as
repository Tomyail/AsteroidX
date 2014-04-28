/**
 * User: xuexin.li
 * Date: 2014/4/17
 * Time: 10:14
 */
package
{
    import ash.core.Engine;
    import ash.core.Entity;
    import ash.core.Entity;

    import component.Asteroid;

    import component.Asteroid;

    import component.Bullet;
    import component.Collision;
    import component.Damage;
    import component.Display;
    import component.EnemyBullet;
    import component.GameState;
    import component.Gun;
    import component.Life;
    import component.Menu;
    import component.Motion;
    import component.PlayerBullet;
    import component.Position;
    import component.Spaceship;
    import component.SubEntity;

    import display.AsteroidView;

    import display.BulletView;
    import display.GunView;
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
            var pos:Position = new Position(50, 50, -Math.PI / 2);
            var spaceShip:Spaceship = new Spaceship()
            createEntity()
                    .add(pos)
                    .add(spaceShip)
                    .add(new Collision(5))
                    .add(new Display(new SpaceshipView()))
                    .add(new Life(lifeView, 300, 1))
                    .add(subEntity);

            //life bar
            subEntity.add(
                    createEntity()
                            .add(new Display(lifeView))
                            .add(pos)
            );

            //gun
            subEntity.add(createGun(pos)
                            .add(new Damage(20))
                            .add(spaceShip)
            );
        }

        private function createGun(pos:Position):Entity
        {
            return createEntity()
                    .add(new Display(new GunView()))
                    .add(new Position(pos.position.x, pos.position.y, pos.rotation))
                    .add(new Gun(0, 0, 0.05, 20))
        }


        private function createEntity():Entity
        {
            var e:Entity = new Entity();
            engine.addEntity(e);
            return e;
        }

        public function createPlayerBullet(gun:Gun, parentPosition:Position, damage:Damage, parent:Object):Entity
        {
            var bullet:Entity = createBulletMaterial(PlayerBullet,gun,parentPosition,damage,parent);
            engine.addEntity(bullet);
            return bullet;
        }

        public function createEnemyBullet(gun:Gun, parentPosition:Position, damage:Damage, parent:Object):Entity
        {
            var bullet:Entity = createBulletMaterial(EnemyBullet,gun,parentPosition,damage,parent);
            engine.addEntity(bullet);
            return bullet;
        }

        private function createBulletMaterial(bulletClz:Class,gun:Gun, parentPosition:Position, damage:Damage, parent:Object):Entity
        {
            var cos:Number = Math.cos(parentPosition.rotation);
            var sin:Number = Math.sin(parentPosition.rotation);
            var bullet:Entity = new Entity()
                    .add(new bulletClz(gun.bulletLifetime))
                    .add(new Position(parentPosition.position.x, parentPosition.position.y, 0))
//                                    cos * gun.offsetFromParent.x - sin * gun.offsetFromParent.y + parentPosition.position.x,
//                                    sin * gun.offsetFromParent.x + cos * gun.offsetFromParent.y + parentPosition.position.y, 0 ) )
                    .add(new Collision(1))
                    .add(new Motion(cos * gun.bulletSpeed, sin * gun.bulletSpeed, 0, 0))
                    .add(new Display(new BulletView()))
                    .add(damage)
//                    .add(parent)
            return bullet;
        }

        public function destroyEntity(entity:Entity):void
        {
            engine.removeEntity(entity);
            if (entity.has(SubEntity))
            {
                var sub:SubEntity = entity.get(SubEntity);
                while (sub.tail)
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
            var asteroid:Asteroid = new Asteroid();
            var motion:Motion = new Motion(( Math.random() - 0.5 ) * 4 * ( 50 - radius ), ( Math.random() - 0.5 ) * 4 * ( 50 - radius ), Math.random() * 2 - 1, 0)
            createEntity()
                    .add(asteroid)
                    .add(pos)
                    .add(new Collision(radius))
                    .add(motion)
                    .add(new Display(new AsteroidView(radius)))
                    .add(new Life(lifeView, 100, 1))
                    .add(new Gun(0, 0, Math.random() * 5, 20))
                    .add(subEntity)


            subEntity.add(
                    createEntity()
                            .add(new Display(lifeView))
                            .add(pos)
            );

            subEntity.add(createGun(pos)
                            .add(new Damage(10))
                            .add(asteroid)
                            .add(motion.clone())
            )

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
