package com.rpgGame.netData.player.message{
	import com.rpgGame.netData.player.bean.AttributeItem;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 广播人物战斗属性变化消息(血量最大血量一类)
	 */
	public class BroadcastPlayerAttriChangeMessage extends Message {
	
		//玩家id
		private var _playerid: long;
		
		//变更的属性
		private var _attributeChange: AttributeItem;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家id
			writeLong(_playerid);
			//变更的属性
			writeBean(_attributeChange);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家id
			_playerid = readLong();
			//变更的属性
			_attributeChange = readBean(AttributeItem) as AttributeItem;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103105;
		}
		
		/**
		 * get 玩家id
		 * @return 
		 */
		public function get playerid(): long{
			return _playerid;
		}
		
		/**
		 * set 玩家id
		 */
		public function set playerid(value: long): void{
			this._playerid = value;
		}
		
		/**
		 * get 变更的属性
		 * @return 
		 */
		public function get attributeChange(): AttributeItem{
			return _attributeChange;
		}
		
		/**
		 * set 变更的属性
		 */
		public function set attributeChange(value: AttributeItem): void{
			this._attributeChange = value;
		}
		
	}
}