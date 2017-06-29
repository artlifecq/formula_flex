package com.rpgGame.netData.guildWar.message{
	import com.rpgGame.netData.guildWar.bean.GuildWarCityApplyInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 回复王城报名信息
	 */
	public class ResGuildWarCityApplyInfoMessage extends Message {
	
		//王城列表
		private var _citys: Vector.<GuildWarCityApplyInfo> = new Vector.<GuildWarCityApplyInfo>();
		//已经报名的王城id,-1:表示还没有报名
		private var _applyCityId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//王城列表
			writeShort(_citys.length);
			for (i = 0; i < _citys.length; i++) {
				writeBean(_citys[i]);
			}
			//已经报名的王城id,-1:表示还没有报名
			writeByte(_applyCityId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//王城列表
			var citys_length : int = readShort();
			for (i = 0; i < citys_length; i++) {
				_citys[i] = readBean(GuildWarCityApplyInfo) as GuildWarCityApplyInfo;
			}
			//已经报名的王城id,-1:表示还没有报名
			_applyCityId = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253102;
		}
		
		/**
		 * get 王城列表
		 * @return 
		 */
		public function get citys(): Vector.<GuildWarCityApplyInfo>{
			return _citys;
		}
		
		/**
		 * set 王城列表
		 */
		public function set citys(value: Vector.<GuildWarCityApplyInfo>): void{
			this._citys = value;
		}
		
		/**
		 * get 已经报名的王城id,-1:表示还没有报名
		 * @return 
		 */
		public function get applyCityId(): int{
			return _applyCityId;
		}
		
		/**
		 * set 已经报名的王城id,-1:表示还没有报名
		 */
		public function set applyCityId(value: int): void{
			this._applyCityId = value;
		}
		
	}
}