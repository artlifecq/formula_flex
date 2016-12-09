package com.rpgGame.netData.vitality.message{
	import com.rpgGame.netData.vitality.bean.VitalityInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送活跃度信息
	 */
	public class ResSendVitalityInfoMessage extends Message {
	
		//活跃度信息
		private var _vitalityInfo: VitalityInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活跃度信息
			writeBean(_vitalityInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活跃度信息
			_vitalityInfo = readBean(VitalityInfo) as VitalityInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 205101;
		}
		
		/**
		 * get 活跃度信息
		 * @return 
		 */
		public function get vitalityInfo(): VitalityInfo{
			return _vitalityInfo;
		}
		
		/**
		 * set 活跃度信息
		 */
		public function set vitalityInfo(value: VitalityInfo): void{
			this._vitalityInfo = value;
		}
		
	}
}