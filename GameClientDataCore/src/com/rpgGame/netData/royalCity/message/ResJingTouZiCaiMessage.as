package com.rpgGame.netData.royalCity.message{
	import com.rpgGame.netData.royalCity.bean.JingTouInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回竞投信息
	 */
	public class ResJingTouZiCaiMessage extends Message {
	
		//竞投信息列表
		private var _jingTouInfos: Vector.<JingTouInfo> = new Vector.<JingTouInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//竞投信息列表
			writeShort(_jingTouInfos.length);
			for (i = 0; i < _jingTouInfos.length; i++) {
				writeBean(_jingTouInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//竞投信息列表
			var jingTouInfos_length : int = readShort();
			for (i = 0; i < jingTouInfos_length; i++) {
				_jingTouInfos[i] = readBean(JingTouInfo) as JingTouInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 222502;
		}
		
		/**
		 * get 竞投信息列表
		 * @return 
		 */
		public function get jingTouInfos(): Vector.<JingTouInfo>{
			return _jingTouInfos;
		}
		
		/**
		 * set 竞投信息列表
		 */
		public function set jingTouInfos(value: Vector.<JingTouInfo>): void{
			this._jingTouInfos = value;
		}
		
	}
}