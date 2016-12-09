package com.rpgGame.netData.sign.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送签结果
	 */
	public class ResSendSignResultToClientMessage extends Message {
	
		//签到结果 1签到成功 0签到失败
		private var _signResult: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//签到结果 1签到成功 0签到失败
			writeByte(_signResult);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//签到结果 1签到成功 0签到失败
			_signResult = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 154102;
		}
		
		/**
		 * get 签到结果 1签到成功 0签到失败
		 * @return 
		 */
		public function get signResult(): int{
			return _signResult;
		}
		
		/**
		 * set 签到结果 1签到成功 0签到失败
		 */
		public function set signResult(value: int): void{
			this._signResult = value;
		}
		
	}
}