package com.rpgGame.netData.marriage.message{
	import com.rpgGame.netData.marriage.bean.InteractionInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 夫妻互动结果
	 */
	public class SCInteractionMessage extends Message {
	
		//0 失败  1 成功
		private var _result: int;
		
		//更新互动数据
		private var _interactionInfo: InteractionInfo;
		
		//当前的亲密值
		private var _intimacyValue: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0 失败  1 成功
			writeInt(_result);
			//更新互动数据
			writeBean(_interactionInfo);
			//当前的亲密值
			writeInt(_intimacyValue);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0 失败  1 成功
			_result = readInt();
			//更新互动数据
			_interactionInfo = readBean(InteractionInfo) as InteractionInfo;
			//当前的亲密值
			_intimacyValue = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150108;
		}
		
		/**
		 * get 0 失败  1 成功
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 0 失败  1 成功
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
		/**
		 * get 更新互动数据
		 * @return 
		 */
		public function get interactionInfo(): InteractionInfo{
			return _interactionInfo;
		}
		
		/**
		 * set 更新互动数据
		 */
		public function set interactionInfo(value: InteractionInfo): void{
			this._interactionInfo = value;
		}
		
		/**
		 * get 当前的亲密值
		 * @return 
		 */
		public function get intimacyValue(): int{
			return _intimacyValue;
		}
		
		/**
		 * set 当前的亲密值
		 */
		public function set intimacyValue(value: int): void{
			this._intimacyValue = value;
		}
		
	}
}