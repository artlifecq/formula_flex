package com.rpgGame.netData.map.message{
	import com.rpgGame.netData.map.bean.DoubleRepairInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 双修人员信息
	 */
	public class ResDoubleRepairInfosToClientMessage extends Message {
	
		//双修人员信息
		private var _doubleRepairInfos: Vector.<DoubleRepairInfo> = new Vector.<DoubleRepairInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//双修人员信息
			writeShort(_doubleRepairInfos.length);
			for (i = 0; i < _doubleRepairInfos.length; i++) {
				writeBean(_doubleRepairInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//双修人员信息
			var doubleRepairInfos_length : int = readShort();
			for (i = 0; i < doubleRepairInfos_length; i++) {
				_doubleRepairInfos[i] = readBean(DoubleRepairInfo) as DoubleRepairInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101141;
		}
		
		/**
		 * get 双修人员信息
		 * @return 
		 */
		public function get doubleRepairInfos(): Vector.<DoubleRepairInfo>{
			return _doubleRepairInfos;
		}
		
		/**
		 * set 双修人员信息
		 */
		public function set doubleRepairInfos(value: Vector.<DoubleRepairInfo>): void{
			this._doubleRepairInfos = value;
		}
		
	}
}