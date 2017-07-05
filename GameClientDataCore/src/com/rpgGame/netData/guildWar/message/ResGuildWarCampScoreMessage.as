package com.rpgGame.netData.guildWar.message{
	import com.rpgGame.netData.guildWar.bean.CampScoreInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知阵营积分
	 */
	public class ResGuildWarCampScoreMessage extends Message {
	
		//列表
		private var _infos: Vector.<CampScoreInfo> = new Vector.<CampScoreInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//列表
			writeShort(_infos.length);
			for (i = 0; i < _infos.length; i++) {
				writeBean(_infos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//列表
			var infos_length : int = readShort();
			for (i = 0; i < infos_length; i++) {
				_infos[i] = readBean(CampScoreInfo) as CampScoreInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253106;
		}
		
		/**
		 * get 列表
		 * @return 
		 */
		public function get infos(): Vector.<CampScoreInfo>{
			return _infos;
		}
		
		/**
		 * set 列表
		 */
		public function set infos(value: Vector.<CampScoreInfo>): void{
			this._infos = value;
		}
		
	}
}