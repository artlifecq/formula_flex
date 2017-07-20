package com.rpgGame.app.sender
{
	import com.rpgGame.app.cmdlistener.enum.OpaqueEnum;
	import com.rpgGame.netData.guildWar.message.ReqGetOrePositionMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarApplyMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarCityApplyInfoMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarCityInfoMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarEnterApplyMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarEnterMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarGiveDailyGiftMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarLeaveApplyMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarUseLeaderSkillMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarUseLeaderSkillTransferMessage;
	import com.rpgGame.netData.guildWar.message.ReqTrunInOreMessage;
	
	import org.game.netCore.data.long;

	/**
	 *帮会战发送器
	 *@author dik
	 *2017-7-4
	 **/
	public class GuildWarSender extends BaseSender
	{
		public function GuildWarSender()
		{
			super();
		}
		
		/**
		 *请求帮会战城池信息 
		 * @param opaque
		 * 
		 */
		public static function reqGuildWarCityInfo(opaque:int=0):void
		{
			var msg:ReqGuildWarCityInfoMessage=new ReqGuildWarCityInfoMessage();
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 *告知后台进入王城争霸界面 
		 * @param opaque
		 * 
		 */
		public static function reqEnterGuildWarPanel(opaque:int=0):void
		{
			var msg:ReqGuildWarEnterApplyMessage=new ReqGuildWarEnterApplyMessage();
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 *请求帮会战报名 
		 * @param city
		 * @param opaque
		 * 
		 */
		public static function reqGuildWarApply(city:int,opaque:int=0):void
		{
			var msg:ReqGuildWarApplyMessage=new ReqGuildWarApplyMessage();
			msg.cityId=city;
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 * 请求王城报名信息 
		 * @param type 王城类型,1:卫城,2:王城
		 * @param opaque
		 * 
		 */
		public static function reqGuildWarCityApplyInfo(type:int,opaque:int=0):void
		{
			var msg:ReqGuildWarCityApplyInfoMessage=new ReqGuildWarCityApplyInfoMessage();
			msg.type=type;
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 *告知后台离开报名界面 
		 * 
		 */
		public static function reqGuildWarLeaveApplyPanel(opaque:int=0):void
		{
			var msg:ReqGuildWarLeaveApplyMessage=new ReqGuildWarLeaveApplyMessage();
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 *获取帮会战每日奖励 
		 * @param opaque
		 * 
		 */
		public static function reqGuildWarGiveDailyGift(opaque:int=0):void
		{
			var msg:ReqGuildWarGiveDailyGiftMessage=new ReqGuildWarGiveDailyGiftMessage();
			msg.opaque=OpaqueEnum.GUILDWAR_GIFT;
			sendMsg(msg);
		}
		
		/**
		 *请求进入帮会战 
		 * @param opaque
		 * 
		 */
		public static function reqGuildWarEnter(opaque:int=0):void
		{
			var msg:ReqGuildWarEnterMessage=new ReqGuildWarEnterMessage();
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 *请求上缴矿石 
		 * 
		 */
		public static function reqTrunInOreMessage(opaque:int=0):void
		{
			var msg:ReqTrunInOreMessage=new ReqTrunInOreMessage();
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 *获取对应矿的刷新位置 
		 * @param oreId
		 * @param opaque
		 * 
		 */
		public static function reqGetOrePosition(oreId:int,opaque:int=0):void
		{
			var msg:ReqGetOrePositionMessage=new ReqGetOrePositionMessage();
			msg.oreId=oreId;
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 *请求释放统帅技能 
		 * 
		 */
		public static function reqUseLeaderSkill(opaque:int=0):void
		{
			var msg:ReqGuildWarUseLeaderSkillMessage=new ReqGuildWarUseLeaderSkillMessage();
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 *接受指定统帅的技能 
		 * @param leaderPlayerId
		 * @param opaque
		 * 
		 */
		public static function reqAcceptLeaderSkill(leaderPlayerId:long,opaque:int=0):void
		{
			var msg:ReqGuildWarUseLeaderSkillTransferMessage=new ReqGuildWarUseLeaderSkillTransferMessage();
			msg.opaque=opaque;
			msg.leaderPlayerId=leaderPlayerId;
			sendMsg(msg);
		}
	}
}