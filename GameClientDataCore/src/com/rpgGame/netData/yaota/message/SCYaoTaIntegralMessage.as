package com.rpgGame.netData.yaota.message{
	import com.rpgGame.netData.yaota.bean.YaoTaInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 积分榜
	 */
	public class SCYaoTaIntegralMessage extends Message {
	
		//积分榜
		private var _yaoTaInfo: Vector.<YaoTaInfo> = new Vector.<YaoTaInfo>();
		//自己的数据
		private var _myYaoTaInfo: YaoTaInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//积分榜
			writeShort(_yaoTaInfo.length);
			for (i = 0; i < _yaoTaInfo.length; i++) {
				writeBean(_yaoTaInfo[i]);
			}
			//自己的数据
			writeBean(_myYaoTaInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//积分榜
			var yaoTaInfo_length : int = readShort();
			for (i = 0; i < yaoTaInfo_length; i++) {
				_yaoTaInfo[i] = readBean(YaoTaInfo) as YaoTaInfo;
			}
			//自己的数据
			_myYaoTaInfo = readBean(YaoTaInfo) as YaoTaInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 129106;
		}
		
		/**
		 * get 积分榜
		 * @return 
		 */
		public function get yaoTaInfo(): Vector.<YaoTaInfo>{
			return _yaoTaInfo;
		}
		
		/**
		 * set 积分榜
		 */
		public function set yaoTaInfo(value: Vector.<YaoTaInfo>): void{
			this._yaoTaInfo = value;
		}
		
		/**
		 * get 自己的数据
		 * @return 
		 */
		public function get myYaoTaInfo(): YaoTaInfo{
			return _myYaoTaInfo;
		}
		
		/**
		 * set 自己的数据
		 */
		public function set myYaoTaInfo(value: YaoTaInfo): void{
			this._myYaoTaInfo = value;
		}
		
	}
}