package com.rpgGame.netData.player.message{
	import com.rpgGame.netData.player.bean.AttributeItem;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家属性发生变变化单个模块 (坐骑，婚戒等)
	 */
	public class SCModuleAttributesChangeMessage extends Message {
		
		//模型Id
		private var _modelId: int;
		
		//变化的属性列表
		private var _attributeChangeList: Vector.<AttributeItem> = new Vector.<AttributeItem>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//模型Id
			writeByte(_modelId);
			//变化的属性列表
			writeShort(_attributeChangeList.length);
			for (i = 0; i < _attributeChangeList.length; i++) {
				writeBean(_attributeChangeList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//模型Id
			_modelId = readByte();
			//变化的属性列表
			var attributeChangeList_length : int = readShort();
			for (i = 0; i < attributeChangeList_length; i++) {
				_attributeChangeList[i] = readBean(AttributeItem) as AttributeItem;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103130;
		}
		
		/**
		 * get 模型Id
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set 模型Id
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
		}
		
		/**
		 * get 变化的属性列表
		 * @return 
		 */
		public function get attributeChangeList(): Vector.<AttributeItem>{
			return _attributeChangeList;
		}
		
		/**
		 * set 变化的属性列表
		 */
		public function set attributeChangeList(value: Vector.<AttributeItem>): void{
			this._attributeChangeList = value;
		}
		
	}
}