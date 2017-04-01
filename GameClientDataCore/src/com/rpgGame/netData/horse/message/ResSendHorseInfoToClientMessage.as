package com.rpgGame.netData.horse.message{
	import com.rpgGame.netData.horse.bean.HorseInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送单个坐骑信息
	 */
	public class ResSendHorseInfoToClientMessage extends Message {
	
		//单个坐骑信息
		private var _horseInfo: HorseInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//单个坐骑信息
			writeBean(_horseInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//单个坐骑信息
			_horseInfo = readBean(HorseInfo) as HorseInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 144102;
		}
		
		/**
		 * get 单个坐骑信息
		 * @return 
		 */
		public function get horseInfo(): HorseInfo{
			return _horseInfo;
		}
		
		/**
		 * set 单个坐骑信息
		 */
		public function set horseInfo(value: HorseInfo): void{
			this._horseInfo = value;
		}
		
	}
}