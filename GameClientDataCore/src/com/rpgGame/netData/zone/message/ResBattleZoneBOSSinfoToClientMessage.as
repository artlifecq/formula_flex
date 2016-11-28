package com.rpgGame.netData.zone.message{
	import com.rpgGame.netData.zone.bean.BattleBossInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回前端战役副本BOSS信息
	 */
	public class ResBattleZoneBOSSinfoToClientMessage extends Message {
	
		//BOSS列表
		private var _BattleBossInfos: Vector.<BattleBossInfo> = new Vector.<BattleBossInfo>();
		//用时
		private var _time: int;
		
		//副本模组ID
		private var _zoneModelid: int;
		
		//怪物的剩余
		private var _nownum: int;
		
		//怪物的总数量
		private var _totalnum: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//BOSS列表
			writeShort(_BattleBossInfos.length);
			for (i = 0; i < _BattleBossInfos.length; i++) {
				writeBean(_BattleBossInfos[i]);
			}
			//用时
			writeInt(_time);
			//副本模组ID
			writeInt(_zoneModelid);
			//怪物的剩余
			writeInt(_nownum);
			//怪物的总数量
			writeInt(_totalnum);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//BOSS列表
			var BattleBossInfos_length : int = readShort();
			for (i = 0; i < BattleBossInfos_length; i++) {
				_BattleBossInfos[i] = readBean(BattleBossInfo) as BattleBossInfo;
			}
			//用时
			_time = readInt();
			//副本模组ID
			_zoneModelid = readInt();
			//怪物的剩余
			_nownum = readInt();
			//怪物的总数量
			_totalnum = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155102;
		}
		
		/**
		 * get BOSS列表
		 * @return 
		 */
		public function get BattleBossInfos(): Vector.<BattleBossInfo>{
			return _BattleBossInfos;
		}
		
		/**
		 * set BOSS列表
		 */
		public function set BattleBossInfos(value: Vector.<BattleBossInfo>): void{
			this._BattleBossInfos = value;
		}
		
		/**
		 * get 用时
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 用时
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
		/**
		 * get 副本模组ID
		 * @return 
		 */
		public function get zoneModelid(): int{
			return _zoneModelid;
		}
		
		/**
		 * set 副本模组ID
		 */
		public function set zoneModelid(value: int): void{
			this._zoneModelid = value;
		}
		
		/**
		 * get 怪物的剩余
		 * @return 
		 */
		public function get nownum(): int{
			return _nownum;
		}
		
		/**
		 * set 怪物的剩余
		 */
		public function set nownum(value: int): void{
			this._nownum = value;
		}
		
		/**
		 * get 怪物的总数量
		 * @return 
		 */
		public function get totalnum(): int{
			return _totalnum;
		}
		
		/**
		 * set 怪物的总数量
		 */
		public function set totalnum(value: int): void{
			this._totalnum = value;
		}
		
	}
}