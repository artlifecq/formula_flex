package com.rpgGame.netData.shiji.message{
	import com.rpgGame.netData.shiji.bean.ShiJiInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 同步史记信息
	 */
	public class ResShiJiInfoMessage extends Message {
	
		//史记信息列表
		private var _shiJiInfoList: Vector.<ShiJiInfo> = new Vector.<ShiJiInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//史记信息列表
			writeShort(_shiJiInfoList.length);
			for (i = 0; i < _shiJiInfoList.length; i++) {
				writeBean(_shiJiInfoList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//史记信息列表
			var shiJiInfoList_length : int = readShort();
			for (i = 0; i < shiJiInfoList_length; i++) {
				_shiJiInfoList[i] = readBean(ShiJiInfo) as ShiJiInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 218101;
		}
		
		/**
		 * get 史记信息列表
		 * @return 
		 */
		public function get shiJiInfoList(): Vector.<ShiJiInfo>{
			return _shiJiInfoList;
		}
		
		/**
		 * set 史记信息列表
		 */
		public function set shiJiInfoList(value: Vector.<ShiJiInfo>): void{
			this._shiJiInfoList = value;
		}
		
	}
}