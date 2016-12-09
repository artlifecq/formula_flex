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
	 * 人物数值属性变化消息,对自己(金钱一类)
	 */
	public class ResPlayerAttributeMessage extends Message {
	
		//属性
		private var _attribute: AttributeItem;
		
		//扩展参数
		private var _ext_param: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//属性
			writeBean(_attribute);
			//扩展参数
			writeInt(_ext_param);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//属性
			_attribute = readBean(AttributeItem) as AttributeItem;
			//扩展参数
			_ext_param = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103104;
		}
		
		/**
		 * get 属性
		 * @return 
		 */
		public function get attribute(): AttributeItem{
			return _attribute;
		}
		
		/**
		 * set 属性
		 */
		public function set attribute(value: AttributeItem): void{
			this._attribute = value;
		}
		
		/**
		 * get 扩展参数
		 * @return 
		 */
		public function get ext_param(): int{
			return _ext_param;
		}
		
		/**
		 * set 扩展参数
		 */
		public function set ext_param(value: int): void{
			this._ext_param = value;
		}
		
	}
}