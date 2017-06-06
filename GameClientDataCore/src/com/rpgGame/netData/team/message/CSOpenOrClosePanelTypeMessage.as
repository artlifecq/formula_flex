package com.rpgGame.netData.team.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 打开面板的类型
	 */
	public class CSOpenOrClosePanelTypeMessage extends Message {
	
		//玩家id
		private var _playerId: long;
		
		//面板类型(1.)
		private var _panelType: int;
		
		//操作类型(0.打开面板，1.关闭面板)
		private var _operatingType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家id
			writeLong(_playerId);
			//面板类型(1.)
			writeByte(_panelType);
			//操作类型(0.打开面板，1.关闭面板)
			writeByte(_operatingType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家id
			_playerId = readLong();
			//面板类型(1.)
			_panelType = readByte();
			//操作类型(0.打开面板，1.关闭面板)
			_operatingType = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109216;
		}
		
		/**
		 * get 玩家id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 面板类型(1.)
		 * @return 
		 */
		public function get panelType(): int{
			return _panelType;
		}
		
		/**
		 * set 面板类型(1.)
		 */
		public function set panelType(value: int): void{
			this._panelType = value;
		}
		
		/**
		 * get 操作类型(0.打开面板，1.关闭面板)
		 * @return 
		 */
		public function get operatingType(): int{
			return _operatingType;
		}
		
		/**
		 * set 操作类型(0.打开面板，1.关闭面板)
		 */
		public function set operatingType(value: int): void{
			this._operatingType = value;
		}
		
	}
}