package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildListInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮派列表信息
	 */
	public class ResGuildListInfoMessage extends Message {
	
		//帮派列表
		private var _guildList: Vector.<GuildListInfo> = new Vector.<GuildListInfo>();
		//总页数
		private var _totalPage: int;
		
		//当前页数
		private var _curPage: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//帮派列表
			writeShort(_guildList.length);
			for (i = 0; i < _guildList.length; i++) {
				writeBean(_guildList[i]);
			}
			//总页数
			writeInt(_totalPage);
			//当前页数
			writeInt(_curPage);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//帮派列表
			var guildList_length : int = readShort();
			for (i = 0; i < guildList_length; i++) {
				_guildList[i] = readBean(GuildListInfo) as GuildListInfo;
			}
			//总页数
			_totalPage = readInt();
			//当前页数
			_curPage = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111103;
		}
		
		/**
		 * get 帮派列表
		 * @return 
		 */
		public function get guildList(): Vector.<GuildListInfo>{
			return _guildList;
		}
		
		/**
		 * set 帮派列表
		 */
		public function set guildList(value: Vector.<GuildListInfo>): void{
			this._guildList = value;
		}
		
		/**
		 * get 总页数
		 * @return 
		 */
		public function get totalPage(): int{
			return _totalPage;
		}
		
		/**
		 * set 总页数
		 */
		public function set totalPage(value: int): void{
			this._totalPage = value;
		}
		
		/**
		 * get 当前页数
		 * @return 
		 */
		public function get curPage(): int{
			return _curPage;
		}
		
		/**
		 * set 当前页数
		 */
		public function set curPage(value: int): void{
			this._curPage = value;
		}
		
	}
}