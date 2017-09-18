package com.rpgGame.netData.sign.message{
	import com.rpgGame.netData.sign.bean.SignInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 登录发送已签到信息
	 */
	public class ResSendSignInfoToClientMessage extends Message {
	
		//签到信息
		private var _signInfo: SignInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//签到信息
			writeBean(_signInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//签到信息
			_signInfo = readBean(SignInfo) as SignInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 154101;
		}
		
		/**
		 * get 签到信息
		 * @return 
		 */
		public function get signInfo(): SignInfo{
			return _signInfo;
		}
		
		/**
		 * set 签到信息
		 */
		public function set signInfo(value: SignInfo): void{
			this._signInfo = value;
		}
		
	}
}