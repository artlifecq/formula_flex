package com.rpgGame.netData.horse.message{
	import com.rpgGame.netData.horse.bean.HorseInfo;
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
	public class ResSendHorseAllInfoToClientMessage extends Message {
	
		//坐骑基本数据信息
		private var _horseDataInfo: HorseDataInfo;
		
		//单个坐骑信息列表
		private var _horseInfolist: Vector.<HorseInfo> = new Vector.<HorseInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//坐骑基本数据信息
			writeBean(_horseDataInfo);
			//单个坐骑信息列表
			writeShort(_horseInfolist.length);
			for (i = 0; i < _horseInfolist.length; i++) {
				writeBean(_horseInfolist[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//坐骑基本数据信息
			_horseDataInfo = readBean(HorseDataInfo) as HorseDataInfo;
			//单个坐骑信息列表
			var horseInfolist_length : int = readShort();
			for (i = 0; i < horseInfolist_length; i++) {
				_horseInfolist[i] = readBean(HorseInfo) as HorseInfo;
			}
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
		
		/**
		 * get 单个坐骑信息列表
		 * @return 
		 */
		public function get horseInfolist(): Vector.<HorseInfo>{
			return _horseInfolist;
		}
		
		/**
		 * set 单个坐骑信息列表
		 */
		public function set horseInfolist(value: Vector.<HorseInfo>): void{
			this._horseInfolist = value;
		}
		
	}
}