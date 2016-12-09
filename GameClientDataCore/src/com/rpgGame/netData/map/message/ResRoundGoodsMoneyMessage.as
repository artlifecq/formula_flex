package com.rpgGame.netData.map.message{
	import com.rpgGame.netData.structs.Position;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 特殊处理金币掉落
	 */
	public class ResRoundGoodsMoneyMessage extends Message {
	
		//掉落源位置
		private var _dropsrcpos: com.rpgGame.netData.structs.Position;
		
		//掉落对象Id
		private var _droptargetId: long;
		
		//物品模板Id
		private var _itemModelId: int;
		
		//数量
		private var _num: int;
		
		//坐标X
		private var _x: int;
		
		//坐标Y
		private var _y: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//掉落源位置
			writeBean(_dropsrcpos);
			//掉落对象Id
			writeLong(_droptargetId);
			//物品模板Id
			writeInt(_itemModelId);
			//数量
			writeInt(_num);
			//坐标X
			writeShort(_x);
			//坐标Y
			writeShort(_y);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//掉落源位置
			_dropsrcpos = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			//掉落对象Id
			_droptargetId = readLong();
			//物品模板Id
			_itemModelId = readInt();
			//数量
			_num = readInt();
			//坐标X
			_x = readShort();
			//坐标Y
			_y = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101147;
		}
		
		/**
		 * get 掉落源位置
		 * @return 
		 */
		public function get dropsrcpos(): com.rpgGame.netData.structs.Position{
			return _dropsrcpos;
		}
		
		/**
		 * set 掉落源位置
		 */
		public function set dropsrcpos(value: com.rpgGame.netData.structs.Position): void{
			this._dropsrcpos = value;
		}
		
		/**
		 * get 掉落对象Id
		 * @return 
		 */
		public function get droptargetId(): long{
			return _droptargetId;
		}
		
		/**
		 * set 掉落对象Id
		 */
		public function set droptargetId(value: long): void{
			this._droptargetId = value;
		}
		
		/**
		 * get 物品模板Id
		 * @return 
		 */
		public function get itemModelId(): int{
			return _itemModelId;
		}
		
		/**
		 * set 物品模板Id
		 */
		public function set itemModelId(value: int): void{
			this._itemModelId = value;
		}
		
		/**
		 * get 数量
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 数量
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
		/**
		 * get 坐标X
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set 坐标X
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get 坐标Y
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set 坐标Y
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
	}
}