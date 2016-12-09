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
	 * 同步同地图同队伍玩家位置
	 */
	public class ResTeamSynPosClientMessage extends Message {
	
		//队员ID
		private var _memberid: long;
		
		//像素坐标x
		private var _x: int;
		
		//像素坐标y
		private var _y: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//队员ID
			writeLong(_memberid);
			//像素坐标x
			writeShort(_x);
			//像素坐标y
			writeShort(_y);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//队员ID
			_memberid = readLong();
			//像素坐标x
			_x = readShort();
			//像素坐标y
			_y = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109113;
		}
		
		/**
		 * get 队员ID
		 * @return 
		 */
		public function get memberid(): long{
			return _memberid;
		}
		
		/**
		 * set 队员ID
		 */
		public function set memberid(value: long): void{
			this._memberid = value;
		}
		
		/**
		 * get 像素坐标x
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set 像素坐标x
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get 像素坐标y
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set 像素坐标y
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
	}
}