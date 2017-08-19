package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.common.BgListItemRender;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guildWar.bean.GuildWarGuildRank;
	
	import org.mokylin.skin.app.banghui.wangcheng.WangChengPaiMing_Item;
	
	import starling.display.DisplayObject;
	
	/**
	 *王城争霸 帮会战斗力排行 
	 * @author dik
	 * 
	 */
	public class WczbGuildFightRankItemRender extends BgListItemRender
	{
		public function WczbGuildFightRankItemRender()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin=new WangChengPaiMing_Item();
			_skin.toSprite(this);
		}
		
		private function get skin():WangChengPaiMing_Item
		{
			return _skin as WangChengPaiMing_Item;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==skin.lbBanghui&&this.owner.customData is WczbMapUI){//目前只有王城争霸才获取帮会信息
				var info:GuildWarGuildRank=_data as GuildWarGuildRank;
				GuildSender.reqGuildBriefnessInfo(info.guildId);
			}
		}
		
		override public function get height():Number
		{
			return 27;
		}
		
		override protected function commitData():void
		{
			super.commitData();
			if(_skin){
				if(_data){
					var info:GuildWarGuildRank=_data as GuildWarGuildRank;
					if(info){
						skin.lbNo.text=info.rank.toString();
						skin.lbBanghui.htmlText=HtmlTextUtil.underLine(HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,info.guildName.toString()));
					}
				}
			}
		}
	}
}