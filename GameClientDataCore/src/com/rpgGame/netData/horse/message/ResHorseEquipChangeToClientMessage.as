package com.rpgGame.netData.horse.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 坐骑装备改变
	 */
	public class ResHorseEquipChangeToClientMessage extends Message {
	
		//操作类型(0穿戴1脱下)
		private var _type: int;
		
		//位置(21到24  21鞍具，22缰绳，23蹬具，24蹄铁)
		private var _pos: int;
		
		//坐骑装备信息
		private var _equipInfo: com.rpgGame.netData.backpack.bean.ItemInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//操作类型(0穿戴1脱下)
			writeByte(_type);
			//位置(21到24  21鞍具，22缰绳，23蹬具，24蹄铁)
			writeByte(_pos);
			//坐骑装备信息
			writeBean(_equipInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//操作类型(0穿戴1脱下)
			_type = readByte();
			//位置(21到24  21鞍具，22缰绳，23蹬具，24蹄铁)
			_pos = readByte();
			//坐骑装备信息
			_equipInfo = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 144106;
		}
		
		/**
		 * get 操作类型(0穿戴1脱下)
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 操作类型(0穿戴1脱下)
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 位置(21到24  21鞍具，22缰绳，23蹬具，24蹄铁)
		 * @return 
		 */
		public function get pos(): int{
			return _pos;
		}
		
		/**
		 * set 位置(21到24  21鞍具，22缰绳，23蹬具，24蹄铁)
		 */
		public function set pos(value: int): void{
			this._pos = value;
		}
		
		/**
		 * get 坐骑装备信息
		 * @return 
		 */
		public function get equipInfo(): com.rpgGame.netData.backpack.bean.ItemInfo{
			return _equipInfo;
		}
		
		/**
		 * set 坐骑装备信息
		 */
		public function set equipInfo(value: com.rpgGame.netData.backpack.bean.ItemInfo): void{
			this._equipInfo = value;
		}
		
	}
}