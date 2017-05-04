package com.rpgGame.netData.cheats.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求镶嵌
	 */
	public class CSSetUpNodeMessage extends Message {
	
		//功法Id
		private var _cheatsId: int;
		
		//节点ID
		private var _nodeId: int;
		
		//道具ID
		private var _itemId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//功法Id
			writeInt(_cheatsId);
			//节点ID
			writeInt(_nodeId);
			//道具ID
			writeLong(_itemId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//功法Id
			_cheatsId = readInt();
			//节点ID
			_nodeId = readInt();
			//道具ID
			_itemId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 226203;
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
		 * get 节点ID
		 * @return 
		 */
		public function get nodeId(): int{
			return _nodeId;
		}
		
		/**
		 * set 节点ID
		 */
		public function set nodeId(value: int): void{
			this._nodeId = value;
		}
		
		/**
		 * get 道具ID
		 * @return 
		 */
		public function get itemId(): long{
			return _itemId;
		}
		
		/**
		 * set 道具ID
		 */
		public function set itemId(value: long): void{
			this._itemId = value;
		}
		
	}
}