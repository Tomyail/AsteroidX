/**
 * User: xuexin.li
 * Date: 2014/4/21
 * Time: 19:15
 */
package display
{
    import flash.display.BitmapData;
    import flash.display.Shape;
    import flash.geom.Matrix;

    import starling.display.Image;
    import starling.textures.Texture;

    public class GunView extends Image
    {
        private static var bmpd:BitmapData;

        public function GunView()
        {
            if (!bmpd)
            {
                var shape:Shape = new Shape();
                shape.graphics.beginFill(0x00FF00);
                shape.graphics.drawRect(0, 0, 5, 50)
                shape.graphics.endFill();

                var bitmapData:BitmapData = new BitmapData(shape.width, shape.height, true, 0);
                var transform:Matrix = new Matrix();
                transform.tx = shape.width >> 1;
//                transform.ty = shape.height >> 1;
                bitmapData.draw(shape, transform, null, null, null, true);
                bmpd = bitmapData;
            }


            var texture:Texture = Texture.fromBitmapData(bmpd, false, false, 1);
            super(texture);
            pivotX = bmpd.width>>1
//            pivotY = shape.height >> 1;
        }
    }
}
