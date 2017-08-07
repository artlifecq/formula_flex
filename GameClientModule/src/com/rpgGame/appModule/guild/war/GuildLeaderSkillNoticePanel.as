package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.sender.GuildWarSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.netData.guildWar.message.ResGuildWarLeaderSkillUseMessage;
	
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.banghui.GuildLeaderSkillNotice_Skin;
	import org.mokylin.skin.app.banghui.LeaderHead_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *统帅技能通知面板 
	 * @author Administrator
	 * 
	 */
	public class GuildLeaderSkillNoticePanel extends SkinUIPanel
	{
		private var _skin:GuildLeaderSkillNotice_Skin;
		private var _currentLeads:Vector.<ResGuildWarLeaderSkillUseMessage>;
		private var headItems:Vector.<SkinnableContainer>;
		
		public function GuildLeaderSkillNoticePanel()
		{
			_skin=new GuildLeaderSkillNotice_Skin();
			super(_skin);
			headItems=new Vector.<SkinnableContainer>();
			headItems.push(_skin.leader0);
			headItems.push(_skin.leader1);
			for(var i:int=0;i<headItems.length;i++){
				headItems[i].removeFromParent();
			}
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			if(!_currentLeads){
				_currentLeads=new Vector.<ResGuildWarLeaderSkillUseMessage>();
			}
			if(_currentLeads.length==2){
				_currentLeads.shift();
			}
			_currentLeads.push(data as ResGuildWarLeaderSkillUseMessage);
			for(var i:int=0;i<_currentLeads.length;i++){
				addLeader(_currentLeads[i],headItems[i]);
			}
		}
		
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==(_skin.leader0.skin as LeaderHead_Skin).headImg){
				GuildWarSender.reqAcceptLeaderSkill(_currentLeads[0].leaderPlayerId);
			}else if(target==(_skin.leader1.skin as LeaderHead_Skin).headImg){
				GuildWarSender.reqAcceptLeaderSkill(_currentLeads[1].leaderPlayerId);
			}
		}
		
		private function addLeader(data:ResGuildWarLeaderSkillUseMessage,head:SkinnableContainer):void
		{
			var item:LeaderHead_Skin=head.skin as LeaderHead_Skin;
			item.lbName.text=data.leaderPlayerName;
//			switch(data.leaderPlayerJob){
//				case JobEnum.ROLE_1_TYPE:
//					item.headImg.styleName=AssetUrl.HEAD_ICON_1;
//					break;
//				case JobEnum.ROLE_2_TYPE:
//					item.headImg.styleName=AssetUrl.HEAD_ICON_2;
//					break;
//				case JobEnum.ROLE_3_TYPE:
//					item.headImg.styleName=AssetUrl.HEAD_ICON_3;
//					break;
//				case JobEnum.ROLE_4_TYPE:
//					item.headImg.styleName=AssetUrl.HEAD_ICON_4;
//					break;
//			}
			item.headImg.styleName=AssetUrl.getRoleHeadUrl(data.leaderPlayerJob,1,"middle");
			_skin.headGrp.addChild(head);
		}
		
		override public function hide():void
		{
			super.hide();
			_currentLeads.length=0;
			for(var i:int=0;i<headItems.length;i++){
				headItems[i].removeFromParent();
			}
		}
	}
}