package com.rpgGame.netData.zone.message{
	import com.rpgGame.netData.zone.bean.MultiZonePanelInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 多人副本面板全部信息
	 */
	public class SCMultiZonePanelInfosMessage extends Message {
	
		//面板信息列表
		private var _panelInfos: Vector.<MultiZonePanelInfo> = new Vector.<MultiZonePanelInfo>();
		//多人副本今日总共挑战次数
		private var _challengeCount: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//面板信息列表
			writeShort(_panelInfos.length);
			for (i = 0; i < _panelInfos.length; i++) {
				writeBean(_panelInfos[i]);
			}
			//多人副本今日总共挑战次数
			writeByte(_challengeCount);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//面板信息列表
			var panelInfos_length : int = readShort();
			for (i = 0; i < panelInfos_length; i++) {
				_panelInfos[i] = readBean(MultiZonePanelInfo) as MultiZonePanelInfo;
			}
			//多人副本今日总共挑战次数
			_challengeCount = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155146;
		}
		
		/**
		 * get 面板信息列表
		 * @return 
		 */
		public function get panelInfos(): Vector.<MultiZonePanelInfo>{
			return _panelInfos;
		}
		
		/**
		 * set 面板信息列表
		 */
		public function set panelInfos(value: Vector.<MultiZonePanelInfo>): void{
			this._panelInfos = value;
		}
		
		/**
		 * get 多人副本今日总共挑战次数
		 * @return 
		 */
		public function get challengeCount(): int{
			return _challengeCount;
		}
		
		/**
		 * set 多人副本今日总共挑战次数
		 */
		public function set challengeCount(value: int): void{
			this._challengeCount = value;
		}
		
	}
}