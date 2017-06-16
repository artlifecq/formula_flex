package com.rpgGame.netData.warFlag.message{
	import com.rpgGame.netData.warFlag.bean.WarFlagDataInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送整个战旗数据信息消息
	 */
	public class SCWarFlagAllInfoToClientMessage extends Message {
	
		//战旗基本数据信息
		private var _warFlagDataInfo: WarFlagDataInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//战旗基本数据信息
			writeBean(_warFlagDataInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//战旗基本数据信息
			_warFlagDataInfo = readBean(WarFlagDataInfo) as WarFlagDataInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 229101;
		}
		
		/**
		 * get 战旗基本数据信息
		 * @return 
		 */
		public function get warFlagDataInfo(): WarFlagDataInfo{
			return _warFlagDataInfo;
		}
		
		/**
		 * set 战旗基本数据信息
		 */
		public function set warFlagDataInfo(value: WarFlagDataInfo): void{
			this._warFlagDataInfo = value;
		}
		
	}
}