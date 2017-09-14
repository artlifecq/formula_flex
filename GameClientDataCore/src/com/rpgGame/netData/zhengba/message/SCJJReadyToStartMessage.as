package com.rpgGame.netData.zhengba.message{
	import com.rpgGame.netData.zhengba.bean.JJPlayerInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 准备开始比赛
	 */
	public class SCJJReadyToStartMessage extends Message {
	
		//准备时间  秒
		private var _delayTime: int;
		
		//左边
		private var _jJPlayerInfo_1: JJPlayerInfo;
		
		//右边边
		private var _jJPlayerInfo_2: JJPlayerInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//准备时间  秒
			writeInt(_delayTime);
			//左边
			writeBean(_jJPlayerInfo_1);
			//右边边
			writeBean(_jJPlayerInfo_2);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//准备时间  秒
			_delayTime = readInt();
			//左边
			_jJPlayerInfo_1 = readBean(JJPlayerInfo) as JJPlayerInfo;
			//右边边
			_jJPlayerInfo_2 = readBean(JJPlayerInfo) as JJPlayerInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 127111;
		}
		
		/**
		 * get 准备时间  秒
		 * @return 
		 */
		public function get delayTime(): int{
			return _delayTime;
		}
		
		/**
		 * set 准备时间  秒
		 */
		public function set delayTime(value: int): void{
			this._delayTime = value;
		}
		
		/**
		 * get 左边
		 * @return 
		 */
		public function get jJPlayerInfo_1(): JJPlayerInfo{
			return _jJPlayerInfo_1;
		}
		
		/**
		 * set 左边
		 */
		public function set jJPlayerInfo_1(value: JJPlayerInfo): void{
			this._jJPlayerInfo_1 = value;
		}
		
		/**
		 * get 右边边
		 * @return 
		 */
		public function get jJPlayerInfo_2(): JJPlayerInfo{
			return _jJPlayerInfo_2;
		}
		
		/**
		 * set 右边边
		 */
		public function set jJPlayerInfo_2(value: JJPlayerInfo): void{
			this._jJPlayerInfo_2 = value;
		}
		
	}
}