package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildDipApplyInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送外交交互消息(右下角那个小框框)
	 */
	public class ResApplyUnionGuildMessage extends Message {
	
		//操作类型 1邀请同盟 2添加敌帮 3解除同盟 4解除敌对
		private var _operationType: int;
		
		//帮会外交交互数据信息
		private var _guildDipApplyInfo: GuildDipApplyInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//操作类型 1邀请同盟 2添加敌帮 3解除同盟 4解除敌对
			writeByte(_operationType);
			//帮会外交交互数据信息
			writeBean(_guildDipApplyInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//操作类型 1邀请同盟 2添加敌帮 3解除同盟 4解除敌对
			_operationType = readByte();
			//帮会外交交互数据信息
			_guildDipApplyInfo = readBean(GuildDipApplyInfo) as GuildDipApplyInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111111;
		}
		
		/**
		 * get 操作类型 1邀请同盟 2添加敌帮 3解除同盟 4解除敌对
		 * @return 
		 */
		public function get operationType(): int{
			return _operationType;
		}
		
		/**
		 * set 操作类型 1邀请同盟 2添加敌帮 3解除同盟 4解除敌对
		 */
		public function set operationType(value: int): void{
			this._operationType = value;
		}
		
		/**
		 * get 帮会外交交互数据信息
		 * @return 
		 */
		public function get guildDipApplyInfo(): GuildDipApplyInfo{
			return _guildDipApplyInfo;
		}
		
		/**
		 * set 帮会外交交互数据信息
		 */
		public function set guildDipApplyInfo(value: GuildDipApplyInfo): void{
			this._guildDipApplyInfo = value;
		}
		
	}
}