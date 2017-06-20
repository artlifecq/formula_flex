package com.rpgGame.netData.guild.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求任命成员
	 */
	public class ReqGuildAppointMessage extends Message {
	
		//玩家id
		private var _playerId: long;
		
		//玩家职位,1:帮主,3:副帮主,4:长老,5:普通,6:统帅
		private var _memberType: int;
		
		//1:任命统帅模式,0:任命普通管理模式
		private var _leaderModel: int;
		
		//本次操作标识
		private var _opaque: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家id
			writeLong(_playerId);
			//玩家职位,1:帮主,3:副帮主,4:长老,5:普通,6:统帅
			writeByte(_memberType);
			//1:任命统帅模式,0:任命普通管理模式
			writeByte(_leaderModel);
			//本次操作标识
			writeInt(_opaque);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家id
			_playerId = readLong();
			//玩家职位,1:帮主,3:副帮主,4:长老,5:普通,6:统帅
			_memberType = readByte();
			//1:任命统帅模式,0:任命普通管理模式
			_leaderModel = readByte();
			//本次操作标识
			_opaque = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111211;
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
		 * get 玩家职位,1:帮主,3:副帮主,4:长老,5:普通,6:统帅
		 * @return 
		 */
		public function get memberType(): int{
			return _memberType;
		}
		
		/**
		 * set 玩家职位,1:帮主,3:副帮主,4:长老,5:普通,6:统帅
		 */
		public function set memberType(value: int): void{
			this._memberType = value;
		}
		
		/**
		 * get 1:任命统帅模式,0:任命普通管理模式
		 * @return 
		 */
		public function get leaderModel(): int{
			return _leaderModel;
		}
		
		/**
		 * set 1:任命统帅模式,0:任命普通管理模式
		 */
		public function set leaderModel(value: int): void{
			this._leaderModel = value;
		}
		
		/**
		 * get 本次操作标识
		 * @return 
		 */
		public function get opaque(): int{
			return _opaque;
		}
		
		/**
		 * set 本次操作标识
		 */
		public function set opaque(value: int): void{
			this._opaque = value;
		}
		
	}
}