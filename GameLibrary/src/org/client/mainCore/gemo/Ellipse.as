//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.gemo
{
    import flash.geom.Point;

    public class Ellipse 
    {

        protected var _x:Number;
        protected var _y:Number;
        protected var _width:Number;
        protected var _height:Number;

        public function Ellipse(x:Number, y:Number, width:Number, height:Number)
        {
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;
        }

        public function get x():Number
        {
            return (this._x);
        }

        public function set x(xPos:Number):void
        {
            this._x = xPos;
        }

        public function get y():Number
        {
            return (this._y);
        }

        public function set y(yPos:Number):void
        {
            this._y = yPos;
        }

        public function get width():Number
        {
            return (this._width);
        }

        public function set width(width:Number):void
        {
            this._width = width;
        }

        public function get height():Number
        {
            return (this._height);
        }

        public function set height(height:Number):void
        {
            this._height = height;
        }

        public function get center():Point
        {
            return (new Point((this.x + (this.width * 0.5)), (this.y + (this.height * 0.5))));
        }

        public function set center(c:Point):void
        {
            this.x = (c.x - (this.width * 0.5));
            this.y = (c.y - (this.height * 0.5));
        }

        public function get size():Point
        {
            return (new Point(this.width, this.height));
        }

        public function get perimeter():Number
        {
            return ((((Math.sqrt((0.5 * (Math.pow(this.width, 2) + Math.pow(this.height, 2)))) * 3.14159265358979) * 2) * 0.5));
        }

        public function get area():Number
        {
            return (((3.14159265358979 * (this.width * 0.5)) * (this.height * 0.5)));
        }

        public function getPointOfDegree(degree:Number):Point
        {
            var radian:Number = ((degree - 90) * (3.14159265358979 / 180));
            var xRadius:Number = (this.width * 0.5);
            var yRadius:Number = (this.height * 0.5);
            return (new Point(((this.x + xRadius) + (Math.cos(radian) * xRadius)), ((this.y + yRadius) + (Math.sin(radian) * yRadius))));
        }

        public function containsPoint(point:Point):Boolean
        {
            var xRadius:Number = (this.width * 0.5);
            var yRadius:Number = (this.height * 0.5);
            var xTar:Number = ((point.x - this.x) - xRadius);
            var yTar:Number = ((point.y - this.y) - yRadius);
            return (((Math.pow((xTar / xRadius), 2) + Math.pow((yTar / yRadius), 2)) <= 1));
        }

        public function equals(ellipse:Ellipse):Boolean
        {
            return ((((((((this.x == ellipse.x)) && ((this.y == ellipse.y)))) && ((this.width == ellipse.width)))) && ((this.height == ellipse.height))));
        }

        public function clone():Ellipse
        {
            return (new Ellipse(this.x, this.y, this.width, this.height));
        }


    }
}//package org.client.mainCore.gemo
