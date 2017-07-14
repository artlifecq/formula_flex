package com.rpgGame.netData.pet.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送升阶结果信息消息
	 */
	public class ResPetUpResultMessage extends Message {
	
		//侍宠模板ID
		private var _modelId: int;
		
		//本次升阶是否成功(1表示成功0表示失败)
		private var _isSuccess: int;
		
		//本次升阶后的经验值
		private var _rankExp: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//侍宠模板ID
			writeInt(_modelId);
			//本次升阶是否成功(1表示成功0表示失败)
			writeByte(_isSuccess);
			//本次升阶后的经验值
			writeInt(_rankExp);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//侍宠模板ID
			_modelId = readInt();
			//本次升阶是否成功(1表示成功0表示失败)
			_isSuccess = readByte();
			//本次升阶后的经验值
			_rankExp = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148110;
		}
		
		/**
		 * get 侍宠模板ID
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set 侍宠模板ID
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
		}
		
		/**
		 * get 本次升阶是否成功(1表示成功0表示失败)
		 * @return 
		 */
		public function get isSuccess(): int{
			return _isSuccess;
		}
		
		/**
		 * set 本次升阶是否成功(1表示成功0表示失败)
		 */
		public function set isSuccess(value: int): void{
			this._isSuccess = value;
		}
		
		/**
		 * get 本次升阶后的经验值
		 * @return 
		 */
		public function get rankExp(): int{
			return _rankExp;
		}
		
		/**
		 * set 本次升阶后的经验值
		 */
		public function set rankExp(value: int): void{
			this._rankExp = value;
		}
		
	}
}