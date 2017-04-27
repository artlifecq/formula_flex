package com.rpgGame.netData.meridian.bean{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 穴位信息
	 */
	public class AcuPointInfo extends Bean {
	
		//筋脉Id
		private var _MeridId: int;
		
		//穴位ID
		private var _acuPointId: int;
		
		//穴位等级
		private var _level: int;
		
		//镶嵌的砭石
		private var _stone: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//筋脉Id
			writeInt(_MeridId);
			//穴位ID
			writeInt(_acuPointId);
			//穴位等级
			writeInt(_level);
			//镶嵌的砭石
			writeShort(_stone.length);
			for (var i: int = 0; i < _stone.length; i++) {
				writeBean(_stone[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//筋脉Id
			_MeridId = readInt();
			//穴位ID
			_acuPointId = readInt();
			//穴位等级
			_level = readInt();
			//镶嵌的砭石
			var stone_length : int = readShort();
			for (var i: int = 0; i < stone_length; i++) {
				_stone[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			return true;
		}
		
		/**
		 * get 筋脉Id
		 * @return 
		 */
		public function get MeridId(): int{
			return _MeridId;
		}
		
		/**
		 * set 筋脉Id
		 */
		public function set MeridId(value: int): void{
			this._MeridId = value;
		}
		
		/**
		 * get 穴位ID
		 * @return 
		 */
		public function get acuPointId(): int{
			return _acuPointId;
		}
		
		/**
		 * set 穴位ID
		 */
		public function set acuPointId(value: int): void{
			this._acuPointId = value;
		}
		
		/**
		 * get 穴位等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 穴位等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 镶嵌的砭石
		 * @return 
		 */
		public function get stone(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _stone;
		}
		
		/**
		 * set 镶嵌的砭石
		 */
		public function set stone(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._stone = value;
		}
		
	}
}