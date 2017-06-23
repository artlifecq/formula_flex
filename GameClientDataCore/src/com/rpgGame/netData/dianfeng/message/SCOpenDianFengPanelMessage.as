package com.rpgGame.netData.dianfeng.message{
	import com.rpgGame.netData.dianfeng.bean.DianFengDataInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回打开面板
	 */
	public class SCOpenDianFengPanelMessage extends Message {
	
		//巅峰数据
		private var _dianFengDataInfo: DianFengDataInfo;
		
		//1 开始  0 未开启
		private var _state: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//巅峰数据
			writeBean(_dianFengDataInfo);
			//1 开始  0 未开启
			writeInt(_state);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//巅峰数据
			_dianFengDataInfo = readBean(DianFengDataInfo) as DianFengDataInfo;
			//1 开始  0 未开启
			_state = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 128109;
		}
		
		/**
		 * get 巅峰数据
		 * @return 
		 */
		public function get dianFengDataInfo(): DianFengDataInfo{
			return _dianFengDataInfo;
		}
		
		/**
		 * set 巅峰数据
		 */
		public function set dianFengDataInfo(value: DianFengDataInfo): void{
			this._dianFengDataInfo = value;
		}
		
		/**
		 * get 1 开始  0 未开启
		 * @return 
		 */
		public function get state(): int{
			return _state;
		}
		
		/**
		 * set 1 开始  0 未开启
		 */
		public function set state(value: int): void{
			this._state = value;
		}
		
	}
}