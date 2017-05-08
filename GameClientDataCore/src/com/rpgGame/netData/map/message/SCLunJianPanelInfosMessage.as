package com.rpgGame.netData.map.message{
	import com.rpgGame.netData.map.bean.LunJianInfo;
	
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回论剑面板信息
	 */
	public class SCLunJianPanelInfosMessage extends Message {
	
		//论剑数据列表
		private var _lunJianInfos: Vector.<LunJianInfo> = new Vector.<LunJianInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//论剑数据列表
			writeShort(_lunJianInfos.length);
			for (i = 0; i < _lunJianInfos.length; i++) {
				writeBean(_lunJianInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//论剑数据列表
			var lunJianInfos_length : int = readShort();
			for (i = 0; i < lunJianInfos_length; i++) {
				_lunJianInfos[i] = readBean(LunJianInfo) as LunJianInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 227501;
		}
		
		/**
		 * get 论剑数据列表
		 * @return 
		 */
		public function get lunJianInfos(): Vector.<LunJianInfo>{
			return _lunJianInfos;
		}
		
		/**
		 * set 论剑数据列表
		 */
		public function set lunJianInfos(value: Vector.<LunJianInfo>): void{
			this._lunJianInfos = value;
		}
		
	}
}