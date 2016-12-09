package com.rpgGame.netData.stall.message{
	import com.rpgGame.netData.stall.bean.StallInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送人物摊位信息（查看，购买后更新，上下架，摊位信息更新 都用这个）
	 */
	public class ResStallInfoMessage extends Message {
	
		//摊位详细信息
		private var _stallInfo: StallInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//摊位详细信息
			writeBean(_stallInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//摊位详细信息
			_stallInfo = readBean(StallInfo) as StallInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 142102;
		}
		
		/**
		 * get 摊位详细信息
		 * @return 
		 */
		public function get stallInfo(): StallInfo{
			return _stallInfo;
		}
		
		/**
		 * set 摊位详细信息
		 */
		public function set stallInfo(value: StallInfo): void{
			this._stallInfo = value;
		}
		
	}
}