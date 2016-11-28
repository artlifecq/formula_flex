package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
	import com.rpgGame.netData.guild.bean.ApplyPlayerInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知帮主副帮主有新的申请
	 */
	public class ResNoticeGuildBossApplyMessage extends Message {
	
		//邀请人信息
		private var _applyPlayerInfo: ApplyPlayerInfo;
		
		//邀请人造型信息
		private var _inviteModeInfo: com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//邀请人信息
			writeBean(_applyPlayerInfo);
			//邀请人造型信息
			writeBean(_inviteModeInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//邀请人信息
			_applyPlayerInfo = readBean(ApplyPlayerInfo) as ApplyPlayerInfo;
			//邀请人造型信息
			_inviteModeInfo = readBean(com.rpgGame.netData.player.bean.PlayerAppearanceInfo) as com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111109;
		}
		
		/**
		 * get 邀请人信息
		 * @return 
		 */
		public function get applyPlayerInfo(): ApplyPlayerInfo{
			return _applyPlayerInfo;
		}
		
		/**
		 * set 邀请人信息
		 */
		public function set applyPlayerInfo(value: ApplyPlayerInfo): void{
			this._applyPlayerInfo = value;
		}
		
		/**
		 * get 邀请人造型信息
		 * @return 
		 */
		public function get inviteModeInfo(): com.rpgGame.netData.player.bean.PlayerAppearanceInfo{
			return _inviteModeInfo;
		}
		
		/**
		 * set 邀请人造型信息
		 */
		public function set inviteModeInfo(value: com.rpgGame.netData.player.bean.PlayerAppearanceInfo): void{
			this._inviteModeInfo = value;
		}
		
	}
}