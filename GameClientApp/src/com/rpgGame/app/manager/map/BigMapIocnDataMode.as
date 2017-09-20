package com.rpgGame.app.manager.map
{
	public class BigMapIocnDataMode
	{
		
		private var _id:int;
		private var _type:String;
		private var _name:String;
		private var _level:int;
		private var _show:Boolean;
		private var _x:Number;
		private var _y:Number;
		private var _img:String;
		public function BigMapIocnDataMode(id:int=0,type:String="",x:Number=0,y:Number=0,name:String="",level:int=0,show:Boolean=true,img:String="")
		{
			_id=id;
			_type=type;
			_name=name;
			_level=level;
			_show=show;
			_img=img;
			_x=x;
			_y=-Math.abs(y);
		}
		
		/**
		 *大地图图标显示 数据保存 
		 */
		public function get id():int
		{
			return _id;
		}

		/**
		 * @private
		 */
		public function set id(value:int):void
		{
			_id = value;
		}

		/**图标类型*/
		public function get type():String
		{
			return _type;
		}

		/**
		 * @private
		 */
		public function set type(value:String):void
		{
			_type = value;
		}

		/**图标位置y*/
		public function get y():Number
		{
			return _y;
		}

		/**
		 * @private
		 */
		public function set y(value:Number):void
		{
			_y = value;
		}

		/**图标位置x*/
		public function get x():Number
		{
			return _x;
		}

		/**
		 * @private
		 */
		public function set x(value:Number):void
		{
			_x = value;
		}

		/**图标显示的名称*/
		public function get name():String
		{
			return _name;
		}

		/**
		 * @private
		 */
		public function set name(value:String):void
		{
			_name = value;
		}

		public function get level():int
		{
			return _level;
		}

		public function set level(value:int):void
		{
			_level = value;
		}

		public function get show():Boolean
		{
			return _show;
		}

		public function set show(value:Boolean):void
		{
			_show = value;
		}

		public function get img():String
		{
			return _img;
		}

		public function set img(value:String):void
		{
			_img = value;
		}

		

	}
}