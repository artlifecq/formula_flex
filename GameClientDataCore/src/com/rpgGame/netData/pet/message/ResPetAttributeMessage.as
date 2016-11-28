package com.rpgGame.netData.pet.message{
	import com.rpgGame.netData.player.bean.PlayerAttributeItem;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 侍宠属性信息列表
	 */
	public class ResPetAttributeMessage extends Message {
	
		//属性信息
		private var _attributeList: Vector.<com.rpgGame.netData.player.bean.PlayerAttributeItem> = new Vector.<com.rpgGame.netData.player.bean.PlayerAttributeItem>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//属性信息
			writeShort(_attributeList.length);
			for (i = 0; i < _attributeList.length; i++) {
				writeBean(_attributeList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//属性信息
			var attributeList_length : int = readShort();
			for (i = 0; i < attributeList_length; i++) {
				_attributeList[i] = readBean(com.rpgGame.netData.player.bean.PlayerAttributeItem) as com.rpgGame.netData.player.bean.PlayerAttributeItem;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148106;
		}
		
		/**
		 * get 属性信息
		 * @return 
		 */
		public function get attributeList(): Vector.<com.rpgGame.netData.player.bean.PlayerAttributeItem>{
			return _attributeList;
		}
		
		/**
		 * set 属性信息
		 */
		public function set attributeList(value: Vector.<com.rpgGame.netData.player.bean.PlayerAttributeItem>): void{
			this._attributeList = value;
		}
		
	}
}