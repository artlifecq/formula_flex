package com.rpgGame.netData.cheats.bean{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 节点信息
	 */
	public class NodeInfo extends Bean {
	
		//功法Id
		private var _cheatsId: int;
		
		//节点Id
		private var _nodeId: int;
		
		//节点等级
		private var _level: int;
		
		//镶嵌的砭石
		private var _stone: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//功法Id
			writeInt(_cheatsId);
			//节点Id
			writeInt(_nodeId);
			//节点等级
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
			//功法Id
			_cheatsId = readInt();
			//节点Id
			_nodeId = readInt();
			//节点等级
			_level = readInt();
			//镶嵌的砭石
			var stone_length : int = readShort();
			for (var i: int = 0; i < stone_length; i++) {
				_stone[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			return true;
		}
		
		/**
		 * get 功法Id
		 * @return 
		 */
		public function get cheatsId(): int{
			return _cheatsId;
		}
		
		/**
		 * set 功法Id
		 */
		public function set cheatsId(value: int): void{
			this._cheatsId = value;
		}
		
		/**
		 * get 节点Id
		 * @return 
		 */
		public function get nodeId(): int{
			return _nodeId;
		}
		
		/**
		 * set 节点Id
		 */
		public function set nodeId(value: int): void{
			this._nodeId = value;
		}
		
		/**
		 * get 节点等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 节点等级
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