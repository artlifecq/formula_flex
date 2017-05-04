package com.rpgGame.netData.cheats.bean{
	import com.rpgGame.netData.cheats.bean.NodeInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 功法信息
	 */
	public class CheatsInfo extends Bean {
	
		//功法Id
		private var _cheatsId: int;
		
		//功法等级
		private var _level: int;
		
		//节点列表
		private var _nodelist: Vector.<NodeInfo> = new Vector.<NodeInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//功法Id
			writeInt(_cheatsId);
			//功法等级
			writeInt(_level);
			//节点列表
			writeShort(_nodelist.length);
			for (var i: int = 0; i < _nodelist.length; i++) {
				writeBean(_nodelist[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//功法Id
			_cheatsId = readInt();
			//功法等级
			_level = readInt();
			//节点列表
			var nodelist_length : int = readShort();
			for (var i: int = 0; i < nodelist_length; i++) {
				_nodelist[i] = readBean(NodeInfo) as NodeInfo;
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
		 * get 功法等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 功法等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 节点列表
		 * @return 
		 */
		public function get nodelist(): Vector.<NodeInfo>{
			return _nodelist;
		}
		
		/**
		 * set 节点列表
		 */
		public function set nodelist(value: Vector.<NodeInfo>): void{
			this._nodelist = value;
		}
		
	}
}