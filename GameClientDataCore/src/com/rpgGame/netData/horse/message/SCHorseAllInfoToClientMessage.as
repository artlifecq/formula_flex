package com.rpgGame.netData.horse.message{
	import com.rpgGame.netData.horse.bean.HorseDataInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送整个坐骑数据信息
	 */
	public class SCHorseAllInfoToClientMessage extends Message {
	
		//坐骑基本数据信息
		private var _horseDataInfo: HorseDataInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//坐骑基本数据信息
			writeBean(_horseDataInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//坐骑基本数据信息
			_horseDataInfo = readBean(HorseDataInfo) as HorseDataInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 144101;
		}
		
		/**
		 * get 坐骑基本数据信息
		 * @return 
		 */
		public function get horseDataInfo(): HorseDataInfo{
			return _horseDataInfo;
		}
		
		/**
		 * set 坐骑基本数据信息
		 */
		public function set horseDataInfo(value: HorseDataInfo): void{
			this._horseDataInfo = value;
		}
		
	}
}