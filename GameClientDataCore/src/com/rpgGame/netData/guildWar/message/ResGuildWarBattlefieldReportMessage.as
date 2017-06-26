package com.rpgGame.netData.guildWar.message{
	import com.rpgGame.netData.guildWar.bean.GuildWarBattlefieldReportInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 回复王城战报信息
	 */
	public class ResGuildWarBattlefieldReportMessage extends Message {
	
		//王城战报列表
		private var _reports: Vector.<GuildWarBattlefieldReportInfo> = new Vector.<GuildWarBattlefieldReportInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//王城战报列表
			writeShort(_reports.length);
			for (i = 0; i < _reports.length; i++) {
				writeBean(_reports[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//王城战报列表
			var reports_length : int = readShort();
			for (i = 0; i < reports_length; i++) {
				_reports[i] = readBean(GuildWarBattlefieldReportInfo) as GuildWarBattlefieldReportInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253103;
		}
		
		/**
		 * get 王城战报列表
		 * @return 
		 */
		public function get reports(): Vector.<GuildWarBattlefieldReportInfo>{
			return _reports;
		}
		
		/**
		 * set 王城战报列表
		 */
		public function set reports(value: Vector.<GuildWarBattlefieldReportInfo>): void{
			this._reports = value;
		}
		
	}
}