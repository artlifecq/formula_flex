package com.rpgGame.netData.structs{
	import flash.geom.Point;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 角色坐标类
	 */
	public class Position extends Bean {
	
		//X
		private var _x: int;
		
		//Y
		private var _y: int;
        
		
		public static function FromGridXY(pixx:int, pixy:int):Position
		{
			var ret:Position = new Position();
			/*ret.x = pixx * MGameDefine.GRID_WIDTH + MGameDefine.GRID_WIDTH / 2;
			ret.y = pixy * MGameDefine.GRID_HEIGHT + MGameDefine.GRID_HEIGHT / 2;*/
			return ret;
		}
		
		public static function FromGridPoint(gridpt:Point):Position
		{
			var ret:Position = new Position();
			/*ret.x = gridpt.x * MGameDefine.GRID_WIDTH + MGameDefine.GRID_WIDTH / 2
			ret.y = gridpt.y * MGameDefine.GRID_HEIGHT + MGameDefine.GRID_HEIGHT / 2;*/
			return ret;
		}
		
		public static function FromXY(pixx:int, pixy:int):Position
		{
			var ret:Position = new Position();
			ret.x = pixx;
			ret.y = pixy;
			return ret;
		}
		
		public static function FromPoint(pt:Point):Position
		{
			var ret:Position = new Position();
			ret.x = pt.x;
			ret.y = pt.y;
			return ret;
		}
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//X
			writeShort(x);
			//Y
			writeShort(y);
			return true;
		}
		
		/** 
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//X
			x = readShort();
			//Y
			y = readShort();
			return true;
		}
		
		/**
		 * get X
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set X
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get Y
		 * @return 
		 */
		public function get y(): int{
			return -_y;
		}
		
		/**
		 * set Y
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
		public function ToPoint():Point
		{
			var p:Point = new Point();
			p.x = x;
			p.y = y;
			return p;
		}
		
		public static function ToPoints(positions:Vector.<Position>):Array
		{
			var ret:Array = [];
			for (var i:int = 0; i < positions.length; ++i)
			{
				ret.push(positions[i].ToPoint());
			}
			return ret;
		}
	}
}