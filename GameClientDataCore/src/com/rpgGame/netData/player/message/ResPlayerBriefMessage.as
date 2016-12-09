package com.rpgGame.netData.player.message{
	import com.rpgGame.netData.player.bean.PlayerBriefInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家简要信息
	 */
	public class ResPlayerBriefMessage extends Message {
	
		//玩家简要信息
		private var _playerBriefs: Vector.<PlayerBriefInfo> = new Vector.<PlayerBriefInfo>();
		//控件类型
		private var _controlType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//玩家简要信息
			writeShort(_playerBriefs.length);
			for (i = 0; i < _playerBriefs.length; i++) {
				writeBean(_playerBriefs[i]);
			}
			//控件类型
			writeByte(_controlType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//玩家简要信息
			var playerBriefs_length : int = readShort();
			for (i = 0; i < playerBriefs_length; i++) {
				_playerBriefs[i] = readBean(PlayerBriefInfo) as PlayerBriefInfo;
			}
			//控件类型
			_controlType = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103107;
		}
		
		/**
		 * get 玩家简要信息
		 * @return 
		 */
		public function get playerBriefs(): Vector.<PlayerBriefInfo>{
			return _playerBriefs;
		}
		
		/**
		 * set 玩家简要信息
		 */
		public function set playerBriefs(value: Vector.<PlayerBriefInfo>): void{
			this._playerBriefs = value;
		}
		
		/**
		 * get 控件类型
		 * @return 
		 */
		public function get controlType(): int{
			return _controlType;
		}
		
		/**
		 * set 控件类型
		 */
		public function set controlType(value: int): void{
			this._controlType = value;
		}
		
	}
}